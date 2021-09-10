import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/constants/controller.dart';
import 'package:komiseryardimciligi/models/document_model.dart';
import 'package:komiseryardimciligi/screens/document/document_add_update_delete.dart';
import 'package:komiseryardimciligi/screens/document/pdf_viewer.dart';

import 'card_view_document_menu_item.dart';

class DocumentMenu extends StatelessWidget {
  static const String routeName = "/documentMenu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dokümanlar"),
      ),
      body: Obx(() => GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: documentController.documents.map((DocumentModel document) {
            return SingleDocumentItem(documentModel: document);
          }).toList())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.to(() => DocumentAddUpdateDelete(isUpdate: false));
          //categoryController.categoryAdd(CategoryModel(categoryName: "Matematik"));
        },
      ),
    );
  }
}

class SingleDocumentItem extends StatelessWidget {
  DocumentModel documentModel;

  SingleDocumentItem({required this.documentModel});

  @override
  Widget build(BuildContext context) {
    return CardViewDocumentMenuItem(
      text: documentModel.documentName.toString(),
      fileURL: documentModel.documentIconURL.toString(),
      bgColor: Colors.pink,
      clickListener: () {
/*        categoryModel.categoryName ="ali";
        categoryController.categoryUpdate("29YqDQxm7rzJGISWTLiZ", categoryModel);*/
        Get.to(() => PdfViewer(documentModel));
      },
      onLongClickListener: () {
        Get.to(() => DocumentAddUpdateDelete(
              isUpdate: true,
              document: documentModel,
            ));
      },
    );
  }
}
