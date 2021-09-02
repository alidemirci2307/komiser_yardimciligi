import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/constants/StaticColors.dart';
import 'package:komiseryardimciligi/constants/StaticValues.dart';
import 'package:komiseryardimciligi/utils/UIUtils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StaticValues.app_short_name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      StaticValues.app_name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    const Icon(
                      Icons.local_police_outlined,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
/*                image: DecorationImage(
                  image: AssetImage(
                      'assets/appimage/bg.jpg'),
                  fit: BoxFit.fill,
                ),*/
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                top: 8.0,
              ),
              child: Text(
                "Çalışma Bölümü",
                style: TextStyle(
                    color: StaticColors.drawer_content_title, fontSize: 12),
              ),
            ),
            DrawerMenuItem(
              title: "Test Çöz",
              subtitle: "Bu bölümden test çözebilirsiniz.",
              icon: Icons.quiz,
              isDivider: false,
              clickListener: (){
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              title: "Ders Notları",
              subtitle: "Ders notlarına bu bölümden ulaşabilirsiniz.",
              icon: Icons.note_add,
              isDivider: false,
              clickListener: (){
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              title: "Mülakata Hazırlık",
              subtitle: "Mülakat sorularını bu bölümden bulabilirsiniz.",
              icon: Icons.question_answer,
              isDivider: true,
              clickListener: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(StaticValues.app_short_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
