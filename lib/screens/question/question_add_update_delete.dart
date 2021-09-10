import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/models/category_model.dart';
import 'package:komiseryardimciligi/models/exam_model.dart';

class QuestionAddUpdateDelete extends StatelessWidget {
  bool isUpdate = false;

  QuestionAddUpdateDelete(this.isUpdate);

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

  Rx<CategoryModel>? dropdownCategoryValue;
  Rx<ExamModel>? dropdownExamValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isUpdate ? Text("Soru Güncelleme") : Text("Soru Ekleme"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(
                      () => DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Get.theme.primaryColor,
                            style: BorderStyle.solid,
                          )),
                    ),
                    hint: Text("Lütfen varsa sınav seçiniz"),
                    value: dropdownExamValue?.value,
                    onChanged: (val) =>
                    dropdownExamValue!.value = (val as ExamModel),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Get.theme.primaryColor,
                        style: BorderStyle.solid,
                      )),
                    ),
                    hint: Text("Lütfen kategori seçiniz"),
                    value: dropdownCategoryValue?.value,
                    onChanged: (val) =>
                    dropdownCategoryValue!.value = (val as CategoryModel),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Get.theme.primaryColor,
                    ),
                    items: categoryController.categories
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.categoryName.toString()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  height: 10,
                ),
                SingleOptionWidget(
                    textEditingController: textEditingControllerQuestion,
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
                              /*  document!.documentName =
                                  textEditingControllerDocumentName
                                      .text;
                              document!.documentSort =
                                  _currentSliderValue.value;
                              document!.documentIconURL =
                                  textEditingControllerImageURL.text;
                              documentController
                                  .updateDocument(document!);
                              textEditingControllerDocumentName.text =
                              "";*/
                            } else {
                              /* documentController.addDocument(DocumentModel(
                                  documentIconURL:
                                  textEditingControllerImageURL
                                      .text,
                                  documentName:
                                  textEditingControllerDocumentName
                                      .text
                                      .trim(),
                                  documentSort: _currentSliderValue
                                      .value
                                      .toInt()));
                              textEditingControllerDocumentName.text =
                              "";*/
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
        icon: Icon(icon),
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





