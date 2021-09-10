import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/constants/static_values.dart';
import 'package:komiseryardimciligi/models/exam_model.dart';
import 'package:komiseryardimciligi/screens/exam/exam_add_update_delete.dart';

import 'card_view_exam_menu_item.dart';


class ExamMenu extends StatelessWidget {
  static const String routeName = "/examMenu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sınavlar"),
      ),
      body: Obx(() => GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: examController.exams.map((ExamModel exam) {
            return SingleExamItem(examModel: exam);
          }).toList())),
      floatingActionButton: Visibility(
        visible: StaticValues.isAdmin,
        child: FloatingActionButton(
          child: const Icon(Icons.add,),
          onPressed: (){
            Get.to(()=>ExamAddUpdateDelete(isUpdate: false));
            //categoryController.categoryAdd(CategoryModel(categoryName: "Matematik"));
          },
        ),
      ),
    );
  }
}

class SingleExamItem extends StatelessWidget {
  ExamModel examModel;

  SingleExamItem({required this.examModel});

  @override
  Widget build(BuildContext context) {
    return CardViewExamMenuItem(
      text: examModel.examName.toString(),
      fileURL: examModel.examIconURL.toString(),
      bgColor: Colors.pink,
      clickListener: () {
/*        categoryModel.categoryName ="ali";
        categoryController.categoryUpdate("29YqDQxm7rzJGISWTLiZ", categoryModel);*/
      },
      onLongClickListener: (){
        Get.to(()=>ExamAddUpdateDelete(isUpdate: true,exam: examModel,));
      },
    );
  }
}
