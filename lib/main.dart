import 'package:flutter/material.dart';
import 'package:quizller/alldata.dart';
import 'package:reactiv/dependency_management/dependency.dart';
import 'package:reactiv/reactiv.dart';

void main() {
  runApp(MyApp());
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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controler = Dependency.put<AllData>(AllData());

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
                              listen: controler.questionNumber.reactiv,
                              update: (text) {
                                return controler.showDisplayQuestion();
                              }),
                          Observer(
                              listen: controler.questionNumber.reactiv,
                              update: (num) {
                                return Text(
                                  controler
                                      .questionList[controler.questionNumber]
                                      .questionText,
                                  style: TextStyle(fontSize: 40),
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
                          setState(() {
                            controler.increaseQuestion();
                            bool correctAnswer = controler
                                .questionList[controler.questionNumber].answer;

                            if (correctAnswer == true) {
                              controler.scorekeeper.add(Icon(Icons.check));
                            } else {
                              controler.scorekeeper.add(Icon(Icons.close));
                            }
                          });
                        },
                        child: Text(
                          'True',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            controler.increaseQuestion();
                            bool correctAnswer = controler
                                .questionList[controler.questionNumber].answer;

                            if (correctAnswer == false) {
                              controler.scorekeeper.add(Icon(Icons.check));
                            } else {
                              controler.scorekeeper.add(Icon(Icons.close));
                            }
                          });
                        },
                        child: Text(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controler.scorekeeper,
          ),
        ],
      ),
    );
  }
}
