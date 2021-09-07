class CategoryModel {

  static const ID = "id";
  static const CATEGORY_NAME = "category_name";
  static const CATEGORY_SORT = "category_sort";


  String? id, categoryName;
  int? categorySort;

  CategoryModel({this.id,this.categoryName, this.categorySort});


  CategoryModel.fromMap(Map<String,dynamic> data) {
    id = data[ID];
    categoryName = data[CATEGORY_NAME];
    categorySort = data[CATEGORY_SORT];
  }

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      CATEGORY_NAME: categoryName,
      CATEGORY_SORT: categorySort,
    };


  }
}
