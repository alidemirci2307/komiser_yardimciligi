import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/constants/StaticColors.dart';

class DrawerMenuItem extends StatefulWidget {
  IconData icon;
  String title;
  String subtitle;
  bool isDivider;
  Function clickListener;

  DrawerMenuItem(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.isDivider,
      required this.clickListener});

  @override
  _DrawerMenuItemState createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            widget.icon,
            color: StaticColors.primary_color,
            size: 30,
          ),
          title: Text(
            widget.title,
            style: TextStyle(color: StaticColors.drawer_menu_title, fontSize: 12),
          ),
          subtitle: Text(
            widget.subtitle,
            style:
                TextStyle(color: StaticColors.drawer_menu_subtitle, fontSize: 9),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: StaticColors.primary_color,
            size: 30,
          ),
          onTap: (){
            widget.clickListener();
          },
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
        ),
        if(widget.isDivider == true) Divider(height: 1,color: Theme.of(context).primaryColorLight,thickness: 1,),

      ],
    );
  }
}




