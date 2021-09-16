import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/models/category_model.dart';
import 'package:komiseryardimciligi/models/exam_model.dart';
import 'package:komiseryardimciligi/models/question_model.dart';

class QuestionAddUpdateDelete extends StatelessWidget {
  static const routeName = "/QuestionAdd";
  bool isUpdate = false;

  QuestionModel? question;

  QuestionAddUpdateDelete({required this.isUpdate, this.question});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textEditingControllerQuestion =
      TextEditingController();
  final TextEditingController textEditingControllerOption1 =
      TextEditingController();
  final TextEditingController textEditingControllerOption2 =
      TextEditingController();
  final TextEditingController textEditingControllerOption3 =
      TextEditingController();
  final TextEditingController textEditingControllerOption4 =
      TextEditingController();
  final TextEditingController textEditingControllerOption5 =
      TextEditingController();

  Rxn<CategoryModel> selectedCategoryValue = Rxn<CategoryModel>();
  Rxn<ExamModel> selectedExamValue= Rxn<ExamModel>();

  @override
  Widget build(BuildContext context) {
    if (question != null) {
      examController.exams.forEach((element) {
        if(element.examID!.contains(question!.examId!)){
          selectedExamValue.value = element;
        }
      });

      if(question!.categoryId != null) {
        categoryController.categories.forEach((element) {
          if(element.id!.contains(question!.categoryId!)){
            selectedCategoryValue.value = element;
          }
        });
      }
      textEditingControllerQuestion.text = question!.question!;
      textEditingControllerOption1.text = question!.option1!;
      textEditingControllerOption2.text = question!.option2!;
      textEditingControllerOption3.text = question!.option3!;
      textEditingControllerOption4.text = question!.option4!;
      textEditingControllerOption5.text = question!.option5!;
    }

    return Scaffold(
      appBar: AppBar(
        title: isUpdate ? Text("Soru Güncelleme") : Text("Soru Ekleme"),
      ),
      body: Obx(
        () => AppController.isShowingProgressBar.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Obx(
                          () => DropdownButtonFormField(
                            value: selectedExamValue.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Get.theme.primaryColor,
                                style: BorderStyle.solid,
                              )),
                            ),
                            hint: Text("Lütfen varsa sınav seçiniz"),

                            onChanged: (val) =>
                                selectedExamValue.value = (val as ExamModel),
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Get.theme.primaryColor,
                            ),
                            items: examController.exams
                                .map(
                                  (exam) => DropdownMenuItem(
                                    value: exam,
                                    child: Text(exam.examName.toString()),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        Obx(
                          () => DropdownButtonFormField(
                            value: selectedCategoryValue.value,
                            validator: (value) => value == null
                                ? 'Lütfen bu alanı doldurunuz'
                                : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Get.theme.primaryColor,
                                style: BorderStyle.solid,
                              )),
                            ),
                            hint: Text("Lütfen kategori seçiniz"),

                            onChanged: (val) => selectedCategoryValue.value =
                                (val as CategoryModel),
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Get.theme.primaryColor,
                            ),
                            items: categoryController.categories
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child:
                                        Text(category.categoryName.toString()),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        SingleOptionWidget(
                            textEditingController:
                                textEditingControllerQuestion,
                            hintText: "Lütfen soruyu giriniz",
                            labelText: "Soru",
                            isRequired: true,
                            minLines: 15,
                            icon: Icons.question_answer),
                        Container(
                          height: 10,
                        ),
                        SingleOptionWidget(
                            textEditingController: textEditingControllerOption1,
                            hintText: "Lütfen doğru cevabı giriniz",
                            labelText: "Doğru Cevap (Seçenek 1)",
                            isRequired: true,
                            icon: Icons.looks_one),
                        Container(
                          height: 10,
                        ),
                        SingleOptionWidget(
                            textEditingController: textEditingControllerOption2,
                            hintText: "Lütfen 2. seçeneği giriniz",
                            labelText: "Seçenek 2",
                            isRequired: true,
                            icon: Icons.looks_two),
                        Container(
                          height: 10,
                        ),
                        SingleOptionWidget(
                            textEditingController: textEditingControllerOption3,
                            hintText: "Lütfen 3. seçeneği giriniz",
                            labelText: "Seçenek 3",
                            isRequired: true,
                            icon: Icons.looks_3),
                        Container(
                          height: 10,
                        ),
                        SingleOptionWidget(
                            textEditingController: textEditingControllerOption4,
                            hintText: "Lütfen 4. seçeneği giriniz",
                            labelText: "Seçenek 4",
                            isRequired: true,
                            icon: Icons.looks_4),
                        Container(
                          height: 10,
                        ),
                        SingleOptionWidget(
                            textEditingController: textEditingControllerOption5,
                            hintText: "Lütfen 5. seçeneği giriniz",
                            labelText: "Seçenek 5",
                            isRequired: true,
                            icon: Icons.looks_5),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('İptal Et'),
                              ),
                              isUpdate
                                  ? OutlinedButton(
                                      onPressed: () {
                                        /*documentController
                              .deleteDocument(document!);*/
                                      },
                                      child: const Text(
                                        'Sil',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : SizedBox(),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (isUpdate) {
                                      question!.categoryId =
                                          selectedCategoryValue.value!.id;
                                      question!.examId =
                                          selectedExamValue.value!.examID;
                                      question!.question =
                                          textEditingControllerQuestion.text
                                              .trim();
                                      question!.option1 =
                                          textEditingControllerOption1.text
                                              .trim();
                                      question!.option2 =
                                          textEditingControllerOption2.text
                                              .trim();
                                      question!.option3 =
                                          textEditingControllerOption3.text
                                              .trim();
                                      question!.option4 =
                                          textEditingControllerOption4.text
                                              .trim();
                                      question!.option5 =
                                          textEditingControllerOption5.text
                                              .trim();
                                      questionController
                                          .updateQuestion(question!);
                                    } else {
                                      questionController
                                          .addQuestion(QuestionModel(
                                        examId: selectedExamValue.value == null ? null : selectedExamValue.value!.examID,
                                        categoryId:
                                            selectedCategoryValue.value!.id,
                                        question: textEditingControllerQuestion
                                            .text
                                            .trim(),
                                        option1: textEditingControllerOption1
                                            .text
                                            .trim(),
                                        option2: textEditingControllerOption2
                                            .text
                                            .trim(),
                                        option3: textEditingControllerOption3
                                            .text
                                            .trim(),
                                        option4: textEditingControllerOption4
                                            .text
                                            .trim(),
                                        option5: textEditingControllerOption5
                                            .text
                                            .trim(),
                                      ));
                                    }
                                  }
                                },
                                child: isUpdate
                                    ? const Text('Güncelle')
                                    : const Text('Kaydet'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class SingleOptionWidget extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText, labelText;
  bool isRequired;
  IconData icon;
  int minLines, maxLines;

  SingleOptionWidget(
      {required this.textEditingController,
      required this.hintText,
      required this.labelText,
      required this.isRequired,
      required this.icon,
      this.minLines = 1,
      this.maxLines = 15});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Get.theme.primaryColor,
        ),
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
      ),
      validator: (String? value) {
        if (isRequired) {
          return (value != null && value.length < 3)
              ? 'En az 3 karakter girmeniz gerekmektedir.'
              : null;
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
