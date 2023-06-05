import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'quesBank.dart';

class AllData extends ReactiveController {
  int questionNumber = ReactiveInt(0).value;

  ReactiveList<Icon> scorekeeper = ReactiveList([]);

  final questionList = ReactiveList<QuestionBank>(
    [
      QuestionBank(questionText: 'my village name is penga ?', answer: true),
      QuestionBank(questionText: 'Sumata is a good boy ?', answer: false),
      QuestionBank(questionText: 'India is a City ?', answer: false),
      QuestionBank(
          questionText: 'West bengal\'s is a India State ?', answer: true),
      QuestionBank(questionText: 'AmarDas Mess member is Six ? ', answer: false)
    ],
  );

  void increaseQuestion() {
    if (questionNumber < questionList.length - 1) {
      questionList[questionNumber++].questionText;
    }
  }

  Text showDisplayQuestion() {
    return Text(
      '${(questionNumber + 1)} / ${questionList.length}',
      style: TextStyle(fontSize: 40),
    );
  }
}
