class CategoryModel {
  static const CATEGORY_NAME = "category_name";
  static const ID = "id";

  String? id, categoryName;

  CategoryModel({this.id,this.categoryName});


  CategoryModel.fromMap(Map<String,dynamic> data) {
    id = data[ID];
    categoryName = data[CATEGORY_NAME];
  }

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      CATEGORY_NAME: categoryName,
    };


  }
}
