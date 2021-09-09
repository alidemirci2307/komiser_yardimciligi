import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/constants/static_values.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/controller/category_controller.dart';
import 'package:komiseryardimciligi/screens/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(CategoryController());
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
