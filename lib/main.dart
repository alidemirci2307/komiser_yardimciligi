import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/constants/static_values.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/controller/category_controller.dart';
import 'package:komiseryardimciligi/controller/question_controller.dart';
import 'package:komiseryardimciligi/screens/home_page.dart';
import 'package:komiseryardimciligi/utils/internet_control.dart';

import 'controller/document_controller.dart';
import 'controller/exam_controller.dart';

void main() async{
  //InternetControl.internetListener();
  WidgetsFlutterBinding.ensureInitialized();

  await initialization.then((value) {
    Get.put(AppController());
    Get.put(CategoryController());
    Get.put(ExamController());
    Get.put(DocumentController());
    Get.put(QuestionController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StaticValues.app_short_name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
    );
  }
}




