import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/controller/category_controller.dart';
import 'package:komiseryardimciligi/models/category_model.dart';
import 'package:komiseryardimciligi/screens/category/category_add.dart';
import 'package:komiseryardimciligi/widgets/card_view_quick_menu_item.dart';

class CategoryMenu extends StatelessWidget {
  static const String routeName = "/categoryMenu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
      ),
      body: Obx(() => GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: categoryController.categories.map((CategoryModel category) {
            return SingleCategoryItem(categoryModel: category);
          }).toList())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,),
        onPressed: (){
          Get.to(()=>CategoryAdd());
          //categoryController.categoryAdd(CategoryModel(categoryName: "Matematik"));
        },
      ),
    );
  }
}

class SingleCategoryItem extends StatelessWidget {
  CategoryModel categoryModel;

  SingleCategoryItem({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return CardViewMenuItem(
      text: categoryModel.categoryName.toString(),
      icon: Icons.quiz,
      bgColor: Colors.pink,
      clickListener: () {
/*        categoryModel.categoryName ="ali";
        categoryController.categoryUpdate("29YqDQxm7rzJGISWTLiZ", categoryModel);*/
      },
    );
  }
}
