import 'package:flutter/material.dart';
import 'package:quizller/alldata.dart';
import 'package:reactiv/dependency_management/dependency.dart';
import 'package:reactiv/reactiv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends ReactiveWidget<AllDataController> {
  @override
  AllDataController bindController() {
    return AllDataController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 400,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Observer(
                              listenable: controller.questionNumber,
                              listener: (text) {
                                return controller.showDisplayQuestion();
                              }),
                          Observer(
                              listenable: controller.questionNumber,
                              listener: (questionTextIndex) {
                                return Text(
                                  controller.questionList[questionTextIndex].questionText,
                                  style: const TextStyle(fontSize: 40),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.increaseQuestion();
                          bool correctAnswer = controller
                              .questionList[controller.questionNumber.value]
                              .answer;

                          if (correctAnswer == true) {
                            controller.scorekeeper.add(Icon(Icons.check));
                          } else {
                            controller.scorekeeper.add(Icon(Icons.close));
                          }
                        },
                        child: const Text(
                          'True',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {

                          bool correctAnswer = controller
                              .questionList[controller.questionNumber.value]
                              .answer;

                          if(controller.endQuestion==false){
                            if (correctAnswer == false) {
                              controller.scorekeeper.add(Icon(Icons.check));
                            } else {
                              controller.scorekeeper.add(Icon(Icons.close));
                            }
                          }
                          controller.increaseQuestion();
                        },
                        child: const Text(
                          'False',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Observer(
            listenable: controller.scorekeeper,
            listener: (scoreList) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreList,
              );
            },
          ),
        ],
      ),
    );
  }
}
