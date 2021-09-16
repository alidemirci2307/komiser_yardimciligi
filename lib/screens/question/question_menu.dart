import 'package:flutter/material.dart';
import 'package:komiseryardimciligi/screens/question/question_item.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sınavlar"),
      ),
      body: QuestionItem(),
    );
  }
}
