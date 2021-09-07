import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
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
      .snapshots()
      .map((query) => query.docs
          .map((item) => CategoryModel.fromMap(item.data()))
          .toList());

  Future<void> addCategory(CategoryModel categoryModel) async {
    firebaseCategories
        .add(categoryModel.toMap())
        .then((value) => {
              categoryModel.id = value.id,
              updateCategory(value.id, categoryModel)
            })
        .catchError((error) => {
              print("Ekleme hatası : $error"),
              UIUtils.showMySnackbar(
                  "Kategori Ekleme", "İşlem başarısız olunmuştur $error"),
            });
  }

  Future<void> updateCategory(String doc, CategoryModel categoryModel) async {
    firebaseCategories
        .doc(doc)
        .update(categoryModel.toMap())
        .then((value) => {
              UIUtils.showMySnackbar(
                  "Başarılı", "İşlem başarılı bir şekilde tamamlanmıştır."),
              print("Kategori Güncelleme başarılı ${categoryModel.categoryName} $doc")
            })
        .catchError(
          (error) => {
            print(
                "Güncelleme hatası ${categoryModel.categoryName} $doc -> $error"),
            UIUtils.showMySnackbar(
                "Kategori Ekleme", "İşlem başarısız olunmuştur $error"),
          }
        );
  }
}
