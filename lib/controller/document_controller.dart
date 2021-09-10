import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/models/document_model.dart';
import 'package:komiseryardimciligi/models/document_model.dart';
import 'package:komiseryardimciligi/utils/ui_utils.dart';

class DocumentController extends GetxController {
  static DocumentController instance = Get.find();
  RxList<DocumentModel> documents = RxList<DocumentModel>([]);
  String collection = "documents";
  CollectionReference firebaseDocuments =
      firebaseFirestore.collection("documents");

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    documents.bindStream(getAllDocuments());
  }

  Stream<List<DocumentModel>> getAllDocuments() => firebaseFirestore
      .collection(collection)
      .orderBy("document_sort", descending: false)
      .snapshots()
      .map((query) => query.docs
          .map((item) => DocumentModel.fromMap(item.data()))
          .toList());

  Future<void> addDocument(DocumentModel documentModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseDocuments
        .add(documentModel.toMap())
        .then((value) => {
      documentModel.documentID = value.id,
              updateDocumentWithDoc(value.id, documentModel)
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(documentModel.documentName!),
            });
    AppController.isShowingProgressBar.value = false;
    // AppController.isShowingProgressBar.value = false;
  }

  Future<void> updateDocument(DocumentModel documentModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseDocuments
        .doc(documentModel.documentID)
        .update(documentModel.toMap())
        .then((value) => {
              UIUtils.showSuccessDialog(documentModel.documentName!),
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(documentModel.documentName!),
            });
    AppController.isShowingProgressBar.value = false;
  }

  Future<void> deleteDocument(DocumentModel documentModel) async {
    Get.defaultDialog(
      title: "Silmek istediğinizden emin misiniz?",
      middleText:
          "${documentModel.documentName} silinecektir. Onaylıyor musunuz?",
      actions: [
        ElevatedButton(
          onPressed: () async {
            Get.back();
            AppController.isShowingProgressBar.value = true;

            await firebaseDocuments
                .doc(documentModel.documentID)
                .delete()
                .then((value) => {
                      UIUtils.showSuccessDialog(documentModel.documentName!),
                    })
                .catchError((error) => {
                      UIUtils.showFailureDialog(documentModel.documentName!),
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

  Future<void> updateDocumentWithDoc(
      String doc, DocumentModel documentModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseDocuments
        .doc(doc)
        .update(documentModel.toMap())
        .then((value) => {
      UIUtils.showSuccessDialog(documentModel.documentName!),
            })
        .catchError((error) => {
      UIUtils.showFailureDialog(documentModel.documentName!),
            });

    AppController.isShowingProgressBar.value = false;
  }




}
