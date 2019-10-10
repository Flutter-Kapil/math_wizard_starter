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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(8, 8, 0, 8),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$a + $b =",
                            style: TextStyle(fontSize: 40, color: Colors.green),
                          ))),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
//
                      margin: EdgeInsets.fromLTRB(4, 8, 20, 8),
                      alignment: Alignment.centerRight,
                      child: TextField(
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        controller: myController,
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        autofocus: true,
                        showCursor: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
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
                      myController.text = "";
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
                      myController.text = "";
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
