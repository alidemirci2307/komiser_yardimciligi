import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/models/category_model.dart';
import 'package:komiseryardimciligi/utils/ui_utils.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<CategoryModel> categories = RxList<CategoryModel>([]);
  String collection = "categories";
  CollectionReference firebaseCategories =
      firebaseFirestore.collection("categories");

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    categories.bindStream(getAllCategories());
  }

  Stream<List<CategoryModel>> getAllCategories() => firebaseFirestore
      .collection(collection)
      .orderBy("category_sort", descending: false)
      .snapshots()
      .map((query) => query.docs
          .map((item) => CategoryModel.fromMap(item.data()))
          .toList());

  Future<void> addCategory(CategoryModel categoryModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseCategories
        .add(categoryModel.toMap())
        .then((value) => {
              categoryModel.id = value.id,
              updateCategoryWithDoc(value.id, categoryModel)
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(categoryModel.categoryName!),
            });
    AppController.isShowingProgressBar.value = false;
    // AppController.isShowingProgressBar.value = false;
  }

  Future<void> updateCategory(CategoryModel categoryModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseCategories
        .doc(categoryModel.id)
        .update(categoryModel.toMap())
        .then((value) => {

              UIUtils.showSuccessDialog(categoryModel.categoryName!),
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(categoryModel.categoryName!),
            });
    AppController.isShowingProgressBar.value = false;
  }

  Future<void> deleteCategory(CategoryModel categoryModel) async {
    Get.defaultDialog(
      title: "Silmek istediğinizden emin misiniz?",
      middleText:
          "${categoryModel.categoryName} silinecektir. Onaylıyor musunuz?",
      actions: [
        ElevatedButton(
          onPressed: () async {
            Get.back();
            AppController.isShowingProgressBar.value = true;
            await firebaseCategories
                .doc(categoryModel.id)
                .delete()
                .then((value) => {
                      UIUtils.showSuccessDialog(categoryModel.categoryName!),
                    })
                .catchError((error) => {
                      UIUtils.showFailureDialog(categoryModel.categoryName!),
                    });
            AppController.isShowingProgressBar.value = false;
          },
          child: Text("Evet"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Hayır"),
        ),
      ],
    );
  }

  Future<void> updateCategoryWithDoc(
      String doc, CategoryModel categoryModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseCategories
        .doc(doc)
        .update(categoryModel.toMap())
        .then((value) => {
      UIUtils.showSuccessDialog(categoryModel.categoryName!),
            })
        .catchError((error) => {
      UIUtils.showFailureDialog(categoryModel.categoryName!),
            });

    AppController.isShowingProgressBar.value = false;
  }




}
