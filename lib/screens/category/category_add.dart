import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/models/category_model.dart';

class CategoryAdd extends StatefulWidget {

  static const routeName = "/categoryAdd";

  @override
  _CategoryAddState createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final textEditingControllerCategoryName = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori Ekleme"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: textEditingControllerCategoryName,
                decoration: InputDecoration(
                  icon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                  hintText: 'Lütfen kategori adını giriniz',
                  labelText: 'Kategori Adı',
                ),
                validator: (String? value) {
                  return (value != null && value.length < 3) ? 'En az 3 karakter girmeniz gerekmektedir.' : null;
                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                         Get.back();
                      },
                      child: const Text('İptal Et'),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          categoryController.addCategory(CategoryModel(id: "",categoryName: textEditingControllerCategoryName.text.trim()));
                        }
                      },
                      child: const Text('Kaydet'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
