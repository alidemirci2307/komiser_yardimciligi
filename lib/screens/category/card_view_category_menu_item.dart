import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CardViewCategoryMenuItem extends StatelessWidget {

  String text;
  String fileURL;
  Color bgColor;
  Function clickListener;
  Function? onLongClickListener;

  CardViewCategoryMenuItem({required this.text,required this.fileURL,required this.bgColor, required this.clickListener, this.onLongClickListener});


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
                CachedNetworkImage(
                  height: 50,
                  width: 50,
                  placeholder: (context, url) => Center(
                      child: const CircularProgressIndicator()),
                  imageUrl: fileURL,
                ),
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
