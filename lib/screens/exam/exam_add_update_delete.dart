import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/controller/firebase_storage_controller.dart';
import 'package:komiseryardimciligi/models/exam_model.dart';
//flutter run -d chrome --web-renderer html
class ExamAddUpdateDelete extends StatelessWidget {
  static const routeName = "/categoryAdd";

  bool isUpdate = false;
  ExamModel? exam;

  ExamAddUpdateDelete({required this.isUpdate, this.exam});

  final textEditingControllerExamName = new TextEditingController();
  final textEditingControllerImageURL = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _currentSliderValue = 25.obs;

  RxString fileURL = RxString("");

  @override
  Widget build(BuildContext context) {
    if (exam != null) {
      textEditingControllerExamName.text = exam!.examName!;
      fileURL.value = exam!.examIconURL!;
      textEditingControllerImageURL.text = exam!.examIconURL!;
      _currentSliderValue.value = exam!.examSort!;
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
                        errorWidget: (context, url, error) => Icon(Icons.book,color: Get.theme.primaryColor,size: 50,),
                      ),
                      IconButton(
                        icon: const Icon(Icons.update),
                        tooltip: 'Ekle ya da Değiştir',
                        onPressed: () async {
                          fileURL.value =
                          (await FirebaseStorageProcessController
                              .uploadImage(context, "exams"))!;
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
                      hintText: 'Resim Adresi',
                      labelText: 'Resim Adresi',
                      errorStyle: TextStyle(height: 0),
                    ),
                    validator: (String? value) {
                      return (value != null && value.length < 1)
                          ? 'Lütfen resim seçiniz.'
                          : null;
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: textEditingControllerExamName,
                    decoration: InputDecoration(
                      icon: Icon(Icons.category),
                      border: OutlineInputBorder(),
                      hintText: 'Lütfen sınav adını giriniz',
                      labelText: 'Sınav Adı',
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
                            examController
                                .deleteExam(exam!);
                          },
                          child: const Text('Sil',style: TextStyle(color: Colors.red),),
                        )
                            : SizedBox(),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (isUpdate) {
                                exam!.examName =
                                    textEditingControllerExamName
                                        .text;
                                exam!.examSort =
                                    _currentSliderValue.value;
                                exam!.examIconURL =
                                    textEditingControllerImageURL.text;
                                examController
                                    .updateExam(exam!);
                                textEditingControllerExamName.text =
                                "";
                              } else {
                                examController.addExam(ExamModel(
                                    examIconURL:
                                    textEditingControllerImageURL
                                        .text,
                                    examName:
                                    textEditingControllerExamName
                                        .text
                                        .trim(),
                                    examSort: _currentSliderValue
                                        .value
                                        .toInt()));
                                textEditingControllerExamName.text =
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
