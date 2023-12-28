import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'quesBank.dart';

class AllDataController extends ReactiveController {
  final questionNumber = 0.reactiv;

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
    if (questionNumber.value < questionList.length - 1) {
      questionNumber.value++;
    }
    if(questionNumber.value==questionList.length-1){
      endQuestion=true;
    }
  }
bool endQuestion=false;
  Text showDisplayQuestion() {


    return Text(

      '${(questionNumber.value + 1)} / ${questionList.length}',
      style: TextStyle(fontSize: 40),
    );
  }

}
