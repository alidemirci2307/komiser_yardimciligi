import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/constants/StaticColors.dart';

class CardViewMenuItem extends StatelessWidget {

  String text;
  IconData icon;
  Color bgColor;
  Color textColor;
  Function clickListener;

  CardViewMenuItem({required this.text,required this.icon,required this.bgColor,required this.textColor, required this.clickListener});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        splashColor: StaticColors.primary_color.withAlpha(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon,color: StaticColors.primary_color,size: 30,),
            Text("Test Çöz",style: TextStyle(color: textColor,fontSize: 14,),),
          ],
        ),
        onTap: (){
          clickListener();
        },
      ),

    );
  }
}
