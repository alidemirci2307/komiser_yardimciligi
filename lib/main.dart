

import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/utils/StaticColors.dart';
import 'package:komiseryardimciligi/utils/StaticValues.dart';

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
                    Text(StaticValues.app_name,style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                    Icon(Icons.local_police_outlined,color: Colors.white, size: 50.0,),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color : Colors.blue,
              ),
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
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
