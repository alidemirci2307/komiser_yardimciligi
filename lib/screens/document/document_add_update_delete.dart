import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/controller/firebase_storage_controller.dart';
import 'package:komiseryardimciligi/models/document_model.dart';
//flutter run -d chrome --web-renderer html
class DocumentAddUpdateDelete extends StatelessWidget {
  static const routeName = "/documentAdd";

  bool isUpdate = false;
  DocumentModel? document;

  DocumentAddUpdateDelete({required this.isUpdate, this.document});

  final textEditingControllerDocumentName = new TextEditingController();
  final textEditingControllerImageURL = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _currentSliderValue = 25.obs;

  RxString fileURL = RxString("");

  @override
  Widget build(BuildContext context) {
    if (document != null) {
      textEditingControllerDocumentName.text = document!.documentName!;
      fileURL.value = document!.documentIconURL!;
      textEditingControllerImageURL.text = document!.documentIconURL!;
      _currentSliderValue.value = document!.documentSort!;
    }

    return Scaffold(
      appBar: AppBar(
        title: isUpdate ? Text("Sınav Güncelleme") : Text("Sınav Ekleme"),
      ),
      body: Obx(
            () => AppController.isShowingProgressBar.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        height: 150,
                        placeholder: (context, url) => Center(
                            child: const CircularProgressIndicator()),
                        imageUrl: fileURL.value,
                        errorWidget: (context, url, error) => Icon(Icons.picture_as_pdf,color: Get.theme.primaryColor,size: 50,),
                      ),
                      IconButton(
                        icon: const Icon(Icons.update),
                        tooltip: 'Ekle ya da Değiştir',
                        onPressed: () async {
                          fileURL.value =
                          (await FirebaseStorageProcessController
                              .uploadImage(context, "documents"))!;
                          textEditingControllerImageURL.text =
                              fileURL.value;
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: textEditingControllerImageURL,
                    enabled: false,
                    decoration: InputDecoration(
                      icon: Icon(Icons.image),
                      border: OutlineInputBorder(),
                      hintText: 'Doküman Adresi',
                      labelText: 'Doküman Adresi',
                      errorStyle: TextStyle(height: 0),
                    ),
                    validator: (String? value) {
                      return (value != null && value.length < 1)
                          ? 'Lütfen doküman seçiniz.'
                          : null;
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: textEditingControllerDocumentName,
                    decoration: InputDecoration(
                      icon: Icon(Icons.picture_as_pdf),
                      border: OutlineInputBorder(),
                      hintText: 'Lütfen doküman adını giriniz',
                      labelText: 'Doküman Adı',
                    ),
                    validator: (String? value) {
                      return (value != null && value.length < 3)
                          ? 'En az 3 karakter girmeniz gerekmektedir.'
                          : null;
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Sıra (küçük olan önde olur): "),
                      Text(_currentSliderValue.value.toInt().toString()),
                      Expanded(
                        child: Slider(
                          value: _currentSliderValue.value.toDouble(),
                          min: 1,
                          max: 25,
                          divisions: 25,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            _currentSliderValue.value = value.round();
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('İptal Et'),
                        ),
                        isUpdate
                            ? OutlinedButton(
                          onPressed: () {
                            documentController
                                .deleteDocument(document!);
                          },
                          child: const Text('Sil',style: TextStyle(color: Colors.red),),
                        )
                            : SizedBox(),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (isUpdate) {
                                document!.documentName =
                                    textEditingControllerDocumentName
                                        .text;
                                document!.documentSort =
                                    _currentSliderValue.value;
                                document!.documentIconURL =
                                    textEditingControllerImageURL.text;
                                documentController
                                    .updateDocument(document!);
                                textEditingControllerDocumentName.text =
                                "";
                              } else {
                                documentController.addDocument(DocumentModel(
                                    documentIconURL:
                                    textEditingControllerImageURL
                                        .text,
                                    documentName:
                                    textEditingControllerDocumentName
                                        .text
                                        .trim(),
                                    documentSort: _currentSliderValue
                                        .value
                                        .toInt()));
                                textEditingControllerDocumentName.text =
                                "";
                              }
                            }
                          },
                          child: isUpdate
                              ? const Text('Güncelle')
                              : const Text('Kaydet'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
