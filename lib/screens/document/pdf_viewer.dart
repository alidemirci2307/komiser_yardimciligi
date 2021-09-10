import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komiseryardimciligi/models/document_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  DocumentModel documentModel;

  PdfViewer(this.documentModel);

  PdfViewerController _pdfViewerController = PdfViewerController();
  RxDouble zoom = RxDouble(1.0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(documentModel.documentName.toString()),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.zoom_out,
              color: Colors.white,
            ),
            onPressed: () {
              zoom.value=zoomControl(--zoom.value);
              _pdfViewerController.zoomLevel = zoom.value;
            },
          ),
          IconButton(
            icon: Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
            onPressed: () {
              zoom.value=zoomControl(++zoom.value);
              _pdfViewerController.zoomLevel = zoom.value;
            },
          ),
        ],
      ),
      body: Container(
        child: SfPdfViewer.network(
          documentModel.documentIconURL.toString(),
          controller: _pdfViewerController,
        ),
      ),
    );
  }
}

double zoomControl(double value){
  if(value <= 1){
    value = 1;
  }else if(value > 4){
    value = 4;
  }
  print("value : $value");
  return value;
}
