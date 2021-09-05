import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:komiseryardimciligi/models/category_model.dart';
import 'package:komiseryardimciligi/services/database.dart';

class CategoryMenuViewModel extends ChangeNotifier {
  Database _database = Database();

  getCategoryList() {
    const String ref = 'categories';
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getCategoryListFromApi(ref)
        .map((querySnapshot) => querySnapshot.docs);
    Stream<List<Category>> streamListCategory = streamListDocument.map((listOfDocSnap) => listOfDocSnap.map((docSnap) => Category.fromMap(docSnap.data() as Map<String, dynamic> )).toList());
    return streamListCategory;
  }
}
