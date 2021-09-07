
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/firebase.dart';
import 'package:komiseryardimciligi/constants/static_values.dart';
import 'package:komiseryardimciligi/controller/app_controller.dart';
import 'package:komiseryardimciligi/controller/category_controller.dart';
import 'package:komiseryardimciligi/screens/category/category_add.dart';
import 'package:komiseryardimciligi/screens/category/category_menu.dart';
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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: HomePage.routeName, page:() => HomePage()),
        GetPage(name: CategoryMenu.routeName, page:() => CategoryMenu()),
        GetPage(name: CategoryAdd.routeName, page:() => CategoryAdd()),
      ],
      title: StaticValues.app_short_name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomePage(),

      /* FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Bir hata oluştu"),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),*/
/*      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (context) => HomePage());
          case Menu.routeName:
            return MaterialPageRoute(builder: (context) => Menu());
          default:
            return null;
        }
      },*/
    );
  }
}
