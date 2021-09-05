import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/constants/static_values.dart';
import 'package:komiseryardimciligi/screens/home_page.dart';
import 'package:komiseryardimciligi/screens/category_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StaticValues.app_short_name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: FutureBuilder(
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
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (context) => HomePage());
          case Menu.routeName:
            return MaterialPageRoute(builder: (context) => Menu());
          default:
            return null;
        }
      },
    );
  }
}
