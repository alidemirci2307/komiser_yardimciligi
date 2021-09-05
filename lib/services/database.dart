import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCategoryListFromApi(String referencePath){
    return _firestore.collection(referencePath).snapshots();
  }

}