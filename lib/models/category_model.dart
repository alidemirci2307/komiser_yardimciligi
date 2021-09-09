class CategoryModel {

  static const ID = "id";
  static const CATEGORY_NAME = "category_name";
  static const CATEGORY_SORT = "category_sort";
  static const CATEGORY_ICON_URL = "category_icon_url";


  String? id, categoryName, categoryIconURL;
  int? categorySort;

  CategoryModel({this.id,this.categoryName, this.categorySort, this.categoryIconURL});


  CategoryModel.fromMap(Map<String,dynamic> data) {
    id = data[ID];
    categoryName = data[CATEGORY_NAME];
    categorySort = data[CATEGORY_SORT];
    categoryIconURL = data[CATEGORY_ICON_URL];
  }

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      CATEGORY_NAME: categoryName,
      CATEGORY_SORT: categorySort,
      CATEGORY_ICON_URL: categoryIconURL,
    };


  }
}
