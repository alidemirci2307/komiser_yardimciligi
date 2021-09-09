
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/constants/static_colors.dart';
import 'package:komiseryardimciligi/constants/static_values.dart';
import 'package:komiseryardimciligi/controller/firebase_storage_controller.dart';
import 'package:komiseryardimciligi/utils/ui_utils.dart';
import 'package:komiseryardimciligi/widgets/card_view_quick_menu_item.dart';
import 'package:komiseryardimciligi/widgets/drawer_item.dart';

import 'category/category_menu.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/";
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
                      Text(
                        StaticValues.app_name,
                        style: TextStyle(color: Colors.white,fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const Icon(
                        Icons.local_police_outlined,
                        color: Colors.white,
                        size: 50.0,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: const Text(
                            "v1.50",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Get.theme.primaryColor,
                        Get.theme.primaryColorDark
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
                  style: TextStyle(fontSize: 12),
                ),
              ),
              DrawerMenuItem(
                title: "Test Çöz",
                subtitle: "Bu bölümden test çözebilirsiniz.",
                icon: Icons.quiz,
                isDivider: false,
                clickListener: () {
                  Get.to(() => CategoryMenu());
                  //Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "Çıkmış Sorular",
                subtitle: "Bu bölümden çıkmış soruları çözebilirsiniz.",
                icon: Icons.question_answer,
                isDivider: false,
                clickListener: () {
                  Get.back();

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
                       fontSize: 12),
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
                       fontSize: 12),
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
          actions: [
            IconButton(
              icon: Get.isDarkMode ? Icon(Icons.wb_sunny) : Icon(Icons.nights_stay),
              tooltip: Get.isDarkMode ? 'Gündüz Moduna Geç' : 'Gece Moduna Geç',
              onPressed: () {
                Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
              },
            ),
          ],
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            CardViewMenuItem(
              text: "Test Çöz",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              clickListener: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Deneme"),
                  ),
                );
              },
            ),
            CardViewMenuItem(
              text: "Çıkmış Sorular",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              clickListener: () {},
            ),
            CardViewMenuItem(
              text: "Ders Notları",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              clickListener: () {},
            ),
          ],
        ));
  }
}
