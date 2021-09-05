class Category {
  final String? categoryName;

  Category({this.categoryName});

  Map<String, dynamic> toMap() => {"category_name": categoryName};

  factory Category.fromMap(Map<String,dynamic> categoryMap) => Category(
     categoryName: categoryMap["category_name"]);
}
