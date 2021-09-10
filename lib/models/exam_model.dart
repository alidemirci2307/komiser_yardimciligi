class ExamModel {

  static const EXAM_ID = "exam_id";
  static const EXAM_NAME = "exam_name";
  static const EXAM_SORT = "exam_sort";
  static const EXAM_ICON_URL = "exam_icon_url";


  String? examID, examName, examIconURL;
  int? examSort;

  ExamModel({this.examID,this.examName, this.examSort, this.examIconURL});


  ExamModel.fromMap(Map<String,dynamic> data) {
    examID = data[EXAM_ID];
    examName = data[EXAM_NAME];
    examSort = data[EXAM_SORT];
    examIconURL = data[EXAM_ICON_URL];
  }

  Map<String, dynamic> toMap() {
    return {
      EXAM_ID: examID,
      EXAM_NAME: examName,
      EXAM_SORT: examSort,
      EXAM_ICON_URL: examIconURL,
    };


  }
}
