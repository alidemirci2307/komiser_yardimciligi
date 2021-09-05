import 'package:flutter/material.dart';
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
            color: StaticColors.primary_color,
            size: 30,
          ),
          title: Text(
            title,
            style: TextStyle(color: StaticColors.drawer_menu_title, fontSize: 12),
          ),
          subtitle: Text(
            subtitle,
            style:
            TextStyle(color: StaticColors.drawer_menu_subtitle, fontSize: 9),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: StaticColors.primary_color,
            size: 30,
          ),
          onTap: (){
            clickListener();
          },
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
        ),
        if(isDivider == true) Divider(height: 1,color: Theme.of(context).primaryColorLight,thickness: 1,),

      ],
    );
  }
}






