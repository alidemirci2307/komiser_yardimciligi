import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/static_colors.dart';

class CardViewMenuItem extends StatelessWidget {

  String text;
  IconData icon;
  Color bgColor;
  Function clickListener;
  Function? onLongClickListener;

  CardViewMenuItem({required this.text,required this.icon,required this.bgColor, required this.clickListener, this.onLongClickListener});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        splashColor: Get.theme.primaryColor.withAlpha(30),
        child: SizedBox(
          width: 100,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon,color: Get.theme.accentColor,size: 30,),
                Text(text,style: TextStyle(fontSize: 14,),),
              ],
            ),
          ),
        ),
        onTap: (){
          clickListener();
        },
        onLongPress: (){
          if(onLongClickListener != null){
            onLongClickListener!();
          }

        },
      ),

    );
  }
}
