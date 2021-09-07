import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/static_colors.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDivider;
  final Function clickListener;

  DrawerMenuItem(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.isDivider,
      required this.clickListener});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Get.theme.accentColor,
            size: 30,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
          subtitle: Text(
            subtitle,
            style:
            TextStyle(fontSize: 9),
          ),
          trailing: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          onTap: (){
            clickListener();
          },
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
        ),
        if(isDivider == true) Divider(height: 1,color: Get.theme.primaryColorLight,thickness: 1,),

      ],
    );
  }
}






