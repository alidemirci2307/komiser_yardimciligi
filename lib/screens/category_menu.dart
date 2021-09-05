import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/viewmodels/category_menu_view_model.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  static const String routeName = "/Menu";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryMenuViewModel(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text("Menü"),
        ),
        body: Column(
          children: [
            StreamBuilder<List<Category>>(
                stream:
                Provider.of<CategoryMenuViewModel>(context).getCategoryList(),

                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    return Center(
                      child: Text(
                        "Bir hata oluştu",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (asyncSnapshot.hasData) {
                    return Text("data");
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
