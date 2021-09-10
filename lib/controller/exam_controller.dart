import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/models/exam_model.dart';
import 'package:komiseryardimciligi/utils/ui_utils.dart';

class ExamController extends GetxController {
  static ExamController instance = Get.find();
  RxList<ExamModel> exams = RxList<ExamModel>([]);
  String collection = "exams";
  CollectionReference firebaseExams =
      firebaseFirestore.collection("exams");

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    exams.bindStream(getAllExams());
  }

  Stream<List<ExamModel>> getAllExams() => firebaseFirestore
      .collection(collection)
      .orderBy("exam_sort", descending: false)
      .snapshots()
      .map((query) => query.docs
          .map((item) => ExamModel.fromMap(item.data()))
          .toList());

  Future<void> addExam(ExamModel examModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseExams
        .add(examModel.toMap())
        .then((value) => {
      examModel.examID = value.id,
              updateExamWithDoc(value.id, examModel)
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(examModel.examName!),
            });
    AppController.isShowingProgressBar.value = false;
    // AppController.isShowingProgressBar.value = false;
  }

  Future<void> updateExam(ExamModel examModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseExams
        .doc(examModel.examID)
        .update(examModel.toMap())
        .then((value) => {
              UIUtils.showSuccessDialog(examModel.examName!),
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(examModel.examName!),
            });
    AppController.isShowingProgressBar.value = false;
  }

  Future<void> deleteExam(ExamModel examModel) async {
    Get.defaultDialog(
      title: "Silmek istediğinizden emin misiniz?",
      middleText:
          "${examModel.examName} silinecektir. Onaylıyor musunuz?",
      actions: [
        ElevatedButton(
          onPressed: () async {
            Get.back();
            AppController.isShowingProgressBar.value = true;

            await firebaseExams
                .doc(examModel.examID)
                .delete()
                .then((value) => {
                      UIUtils.showSuccessDialog(examModel.examName!),
                    })
                .catchError((error) => {
                      UIUtils.showFailureDialog(examModel.examName!),
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

  Future<void> updateExamWithDoc(
      String doc, ExamModel examModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseExams
        .doc(doc)
        .update(examModel.toMap())
        .then((value) => {
      UIUtils.showSuccessDialog(examModel.examName!),
            })
        .catchError((error) => {
      UIUtils.showFailureDialog(examModel.examName!),
            });

    AppController.isShowingProgressBar.value = false;
  }




}
