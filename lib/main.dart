import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/constants/StaticColors.dart';
import 'package:komiseryardimciligi/constants/StaticValues.dart';
import 'package:komiseryardimciligi/utils/CardViewUI.dart';
import 'package:komiseryardimciligi/utils/DrawerUI.dart';

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
                        textAlign: TextAlign.center,
                      ),
                      const Icon(
                        Icons.local_police_outlined,
                        color: Colors.white,
                        size: 70.0,
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        StaticColors.drawer_header_start,
                        StaticColors.drawer_header_end
                      ]),
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
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "Çıkmış Sorular",
                subtitle: "Bu bölümden çıkmış soruları çözebilirsiniz.",
                icon: Icons.question_answer,
                isDivider: false,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "Ders Notları",
                subtitle: "Ders notlarına bu bölümden ulaşabilirsiniz.",
                icon: Icons.note_add,
                isDivider: true,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 8.0,
                ),
                child: Text(
                  "Özel Bölüm",
                  style: TextStyle(
                      color: StaticColors.drawer_content_title, fontSize: 12),
                ),
              ),
              DrawerMenuItem(
                title: "Mülakata Hazırlık",
                subtitle: "Mülakat sorularını bu bölümden bulabilirsiniz.",
                icon: Icons.question_answer,
                isDivider: false,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "Özel Denemeler",
                subtitle:
                    "Sizin için yapay zeka ile hazırlanan soruları bulabilirsiniz.",
                icon: Icons.book,
                isDivider: false,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "Kanunlar",
                subtitle: "Polisleri ilgilendiren kanunları bulabilirsiniz.",
                icon: Icons.book_online,
                isDivider: true,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 8.0,
                ),
                child: Text(
                  "Özel Bölüm",
                  style: TextStyle(
                      color: StaticColors.drawer_content_title, fontSize: 12),
                ),
              ),
              DrawerMenuItem(
                title: "Puan Ver",
                subtitle: "Beğendiyseniz, 5 yıldız verirseniz seviniriz.",
                icon: Icons.star,
                isDivider: false,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "İletişim",
                subtitle:
                    "Her türlü görüş, öneri ve şikayetlerinizi iletebilirsiniz.",
                icon: Icons.mail,
                isDivider: false,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(StaticValues.app_short_name),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            CardViewMenuItem(
              text: "Test Çöz",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              textColor: Colors.black,
              clickListener: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Deneme"),),);
              },
            ),
            CardViewMenuItem(
              text: "Çıkmış Sorular",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              textColor: Colors.black,
              clickListener: () {},
            ),
            CardViewMenuItem(
              text: "Ders Notları",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              textColor: Colors.black,
              clickListener: () {},
            ),
          ],
        ));
  }
}
