class DocumentModel {

  static const DOCUMENT_ID = "document_id";
  static const DOCUMENT_NAME = "document_name";
  static const DOCUMENT_SORT = "document_sort";
  static const DOCUMENT_ICON_URL = "document_icon_url";


  String? documentID, documentName, documentIconURL;
  int? documentSort;

  DocumentModel({this.documentID,this.documentName, this.documentSort, this.documentIconURL});


  DocumentModel.fromMap(Map<String,dynamic> data) {
    documentID = data[DOCUMENT_ID];
    documentName = data[DOCUMENT_NAME];
    documentSort = data[DOCUMENT_SORT];
    documentIconURL = data[DOCUMENT_ICON_URL];
  }

  Map<String, dynamic> toMap() {
    return {
      DOCUMENT_ID: documentID,
      DOCUMENT_NAME: documentName,
      DOCUMENT_SORT: documentSort,
      DOCUMENT_ICON_URL: documentIconURL,
    };


  }
}
