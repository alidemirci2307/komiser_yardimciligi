class QuestionModel {
  static const QUESTION_ID = "question_id";
  static const QUESTION_QUESTION = "question";
  static const QUESTION_CATEGORY_ID = "category_id";
  static const QUESTION_EXAM_ID = "exam_id";
  static const QUESTION_OPTION_1 = "option_1";
  static const QUESTION_OPTION_2 = "option_2";
  static const QUESTION_OPTION_3 = "option_3";
  static const QUESTION_OPTION_4 = "option_4";
  static const QUESTION_OPTION_5 = "option_5";

  String? questionId,
      question,
      categoryId,
      examId,
      option1,
      option2,
      option3,
      option4,
      option5;

  QuestionModel({
    this.questionId,
    required this.question,
    required this.categoryId,
    this.examId,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.option5,
  });

  QuestionModel.fromMap(Map<String, dynamic> data) {
    questionId = data[QUESTION_ID];
    question = data[QUESTION_QUESTION];
    categoryId = data[QUESTION_CATEGORY_ID];
    examId = data[QUESTION_EXAM_ID];
    option1 = data[QUESTION_OPTION_1];
    option2 = data[QUESTION_OPTION_2];
    option3 = data[QUESTION_OPTION_3];
    option4 = data[QUESTION_OPTION_4];
    option5 = data[QUESTION_OPTION_5];
  }

  Map<String, dynamic> toMap() {
    return {
      QUESTION_ID: questionId,
      QUESTION_QUESTION: question,
      QUESTION_CATEGORY_ID: categoryId,
      QUESTION_EXAM_ID: examId,
      QUESTION_OPTION_1: option1,
      QUESTION_OPTION_2: option2,
      QUESTION_OPTION_3: option3,
      QUESTION_OPTION_4: option4,
      QUESTION_OPTION_5: option5,
    };
  }
}
