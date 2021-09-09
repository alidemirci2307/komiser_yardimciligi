import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/models/category_model.dart';

class CategoryAdd extends StatelessWidget{
  static const routeName = "/categoryAdd";

  bool isUpdate = false;
  CategoryModel? category;

  CategoryAdd({required this.isUpdate, this.category});


  final textEditingControllerCategoryName = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _currentSliderValue = 25.obs;


  @override
  Widget build(BuildContext context) {

    if(category != null){
      textEditingControllerCategoryName.text = category!.categoryName!;
      _currentSliderValue.value = category!.categorySort!;
    }

    return Scaffold(
      appBar: AppBar(
        title: isUpdate ?  Text("Kategori Güncelleme") : Text("Kategori Ekleme"),
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
                        SizedBox(
                          height: 150,
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            imageUrl:
                            'https://picsum.photos/250?image=9',
                          ),
                        ),
                        Container(height: 10,),
                        TextFormField(
                          controller: textEditingControllerCategoryName,
                          decoration: InputDecoration(
                            icon: Icon(Icons.category),
                            border: OutlineInputBorder(),
                            hintText: 'Lütfen kategori adını giriniz',
                            labelText: 'Kategori Adı',
                          ),
                          validator: (String? value) {
                            return (value != null && value.length < 3)
                                ? 'En az 3 karakter girmeniz gerekmektedir.'
                                : null;
                          },
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
                          padding:
                              const EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('İptal Et'),
                              ),

                              isUpdate ? TextButton(
                                onPressed: () {
                                  categoryController.deleteCategory(category!);
                                },
                                child: const Text('Sil'),
                              ) : SizedBox(),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if(isUpdate){
                                      category!.categoryName = textEditingControllerCategoryName.text;
                                      category!.categorySort = _currentSliderValue.value;
                                      categoryController.updateCategory(category!);
                                      textEditingControllerCategoryName.text = "";
                                    }else{
                                      categoryController.addCategory(CategoryModel(
                                          categoryName:
                                          textEditingControllerCategoryName.text
                                              .trim(),categorySort: _currentSliderValue.value.toInt()));
                                      textEditingControllerCategoryName.text = "";
                                    }

                                  }
                                },
                                child: isUpdate ? const Text('Güncelle') : const Text('Kaydet'),
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
