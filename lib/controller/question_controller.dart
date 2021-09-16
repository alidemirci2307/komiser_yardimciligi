import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/models/question_model.dart';
import 'package:komiseryardimciligi/utils/ui_utils.dart';

class QuestionController extends GetxController {
  static QuestionController instance = Get.find();
  RxList<QuestionModel> questions = RxList<QuestionModel>([]);
  String collection = "questions";
  CollectionReference firebaseQuestions =
      firebaseFirestore.collection("questions");

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    questions.bindStream(getAllQuestions());
  }

  Stream<List<QuestionModel>> getAllQuestions() => firebaseFirestore
      .collection(collection)
      .orderBy("question_sort", descending: false)
      .snapshots()
      .map((query) => query.docs
          .map((item) => QuestionModel.fromMap(item.data()))
          .toList());

  Future<void> addQuestion(QuestionModel questionModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseQuestions
        .add(questionModel.toMap())
        .then((value) => {
      questionModel.questionId = value.id,
              updateQuestionWithDoc(value.id, questionModel)
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(questionModel.questionId!),
            });
    AppController.isShowingProgressBar.value = false;
    // AppController.isShowingProgressBar.value = false;
  }

  Future<void> updateQuestion(QuestionModel questionModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseQuestions
        .doc(questionModel.questionId)
        .update(questionModel.toMap())
        .then((value) => {
              UIUtils.showSuccessDialog(questionModel.questionId!),
            })
        .catchError((error) => {
              UIUtils.showFailureDialog(questionModel.questionId!),
            });
    AppController.isShowingProgressBar.value = false;
  }

  Future<void> deleteQuestion(QuestionModel questionModel) async {
    Get.defaultDialog(
      title: "Silmek istediğinizden emin misiniz?",
      middleText:
          "${questionModel.questionId} silinecektir. Onaylıyor musunuz?",
      actions: [
        ElevatedButton(
          onPressed: () async {
            Get.back();
            AppController.isShowingProgressBar.value = true;

            await firebaseQuestions
                .doc(questionModel.questionId)
                .delete()
                .then((value) => {
                      UIUtils.showSuccessDialog(questionModel.questionId!),
                    })
                .catchError((error) => {
                      UIUtils.showFailureDialog(questionModel.questionId!),
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

  Future<void> updateQuestionWithDoc(
      String doc, QuestionModel questionModel) async {
    AppController.isShowingProgressBar.value = true;
    await firebaseQuestions
        .doc(doc)
        .update(questionModel.toMap())
        .then((value) => {
      UIUtils.showSuccessDialog(questionModel.questionId!),
            })
        .catchError((error) => {
      UIUtils.showFailureDialog(questionModel.questionId!),
            });

    AppController.isShowingProgressBar.value = false;
  }




}
