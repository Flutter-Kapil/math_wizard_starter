import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final myController = TextEditingController();
  int a = Random().nextInt(20);
  int b = Random().nextInt(20);
  int score = 0;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('MathWiz'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text(
                                "$a+$b=",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.green),
                              ))),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(8.0),
                          alignment: Alignment.centerRight,
                          child: TextField(
                            controller: myController,
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            autofocus: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
//            Expanded(flex: 1, child: Container(child: Text(myController.text))),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    color: Colors.green,
                    child: Text("Check", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      int c = a + b;
                      String sum = "$c";
                      print(
                          "You entered ${myController.text} and answer is $c");
                      if (sum == myController.text) {
                        score = score + 5;
                      } else {
                        score = score - 5;
                      }
                      a = Random().nextInt(20);
                      b = Random().nextInt(20);
                      setState(() {});
                    },
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text("Skip", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      a = Random().nextInt(20);
                      b = Random().nextInt(20);
                      setState(() {});
                    },
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Score: $score",
                      style: TextStyle(fontSize: 30, color: Colors.green)),
                )),
          ],
        ),
      ),
    );
  }
}
