
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/constants/static_colors.dart';
import 'package:komiseryardimciligi/constants/static_values.dart';
import 'package:komiseryardimciligi/controller/firebase_storage_controller.dart';
import 'package:komiseryardimciligi/screens/document/document_menu.dart';
import 'package:komiseryardimciligi/screens/exam/exam_menu.dart';
import 'package:komiseryardimciligi/screens/question/question_add_update_delete.dart';
import 'package:komiseryardimciligi/screens/question/question_menu.dart';
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
                  "??al????ma B??l??m??",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              DrawerMenuItem(
                title: "Test ????z",
                subtitle: "Bu b??l??mden test ????zebilirsiniz.",
                icon: Icons.quiz,
                isDivider: false,
                clickListener: () {
                  Get.to(() => CategoryMenu());
                  //Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "????km???? Sorular",
                subtitle: "Bu b??l??mden ????km???? sorular?? ????zebilirsiniz.",
                icon: Icons.question_answer,
                isDivider: false,
                clickListener: () {
                  Get.back();
                  Get.to(() => ExamMenu());

                },
              ),
              DrawerMenuItem(
                title: "Ders Notlar??",
                subtitle: "Ders notlar??na bu b??l??mden ula??abilirsiniz.",
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
                  "??zel B??l??m",
                  style: TextStyle(
                       fontSize: 12),
                ),
              ),
              DrawerMenuItem(
                title: "M??lakata Haz??rl??k",
                subtitle: "M??lakat sorular??n?? bu b??l??mden bulabilirsiniz.",
                icon: Icons.question_answer,
                isDivider: false,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "??zel Denemeler",
                subtitle:
                "Sizin i??in yapay zeka ile haz??rlanan sorular?? bulabilirsiniz.",
                icon: Icons.book,
                isDivider: false,
                clickListener: () {
                  Get.back();
                },
              ),
              DrawerMenuItem(
                title: "Kanunlar",
                subtitle: "Polisleri ilgilendiren kanunlar?? bulabilirsiniz.",
                icon: Icons.book_online,
                isDivider: true,
                clickListener: () {
                  Get.back();
                  Get.to(()=>DocumentMenu());
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 8.0,
                ),
                child: Text(
                  "??zel B??l??m",
                  style: TextStyle(
                       fontSize: 12),
                ),
              ),
              DrawerMenuItem(
                title: "Puan Ver",
                subtitle: "Be??endiyseniz, 5 y??ld??z verirseniz seviniriz.",
                icon: Icons.star,
                isDivider: false,
                clickListener: () {
                  Navigator.pop(context);
                },
              ),
              DrawerMenuItem(
                title: "??leti??im",
                subtitle:
                "Her t??rl?? g??r????, ??neri ve ??ikayetlerinizi iletebilirsiniz.",
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
              tooltip: Get.isDarkMode ? 'G??nd??z Moduna Ge??' : 'Gece Moduna Ge??',
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
              text: "Test ????z",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              clickListener: () {
                 Get.to(()=>QuestionAddUpdateDelete(isUpdate: false,));
              },
            ),
            CardViewMenuItem(
              text: "????km???? Sorular",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              clickListener: () {
                Get.to(()=>QuestionList());
              },
            ),
            CardViewMenuItem(
              text: "Ders Notlar??",
              icon: Icons.quiz,
              bgColor: Colors.pink,
              clickListener: () {},
            ),
          ],
        ));
  }
}
