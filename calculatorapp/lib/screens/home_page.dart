import 'package:calculatorapp/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double width;
  late double height;
  var question = "";
  var answer = "";
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "=",
    "^"
  ];
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: width,
            height: height * 0.36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.001,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: (Text(
                    question,
                    style: TextStyle(fontSize: 30),
                  )),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: (Text(
                    answer,
                    style: TextStyle(fontSize: 30),
                  )),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            height: height * 0.64,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                /**
                 * clear button
                 */
                if (index == 0) {
                  return MyButton(
                      ontap: () {
                        setState(() {
                          question = "";
                          answer = "";
                        });
                      },
                      textcolor: Colors.white,
                      textstring: "C",
                      backgroundcolor: Colors.green);
                }
                /**
                   * delete button
                   */
                else if (index == 1) {
                  return MyButton(
                      ontap: () {
                        setState(() {
                          question = question.substring(0, question.length - 1);
                        });
                      },
                      textcolor: Colors.white,
                      textstring: "DEL",
                      backgroundcolor: Colors.red);
                }
                /**
                   * equal button
                */

                else if (index == 18) {
                  return MyButton(
                      ontap: () {
                        setState(() {
                          equal();
                        });
                      },
                      textcolor: Colors.white,
                      textstring: "=",
                      backgroundcolor: Colors.red);
                }
                /**
                   * numbers and operators buttons 
                */
                else {
                  return MyButton(
                      textcolor: isoperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                      textstring: buttons[index],
                      ontap: () {
                        setState(() {
                          question = question + buttons[index];
                        });
                      },
                      backgroundcolor: isoperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.white);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void equal() {
    String userquestion = question;
    userquestion = userquestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(userquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    print('Expression: $exp');
  }

  bool isoperator(String x) {
    if (x == "%" ||
        x == "/" ||
        x == "x" ||
        x == "-" ||
        x == "+" ||
        x == "/" ||
        x == "=" ||
        x == "^") {
      return true;
    }
    return false;
  }
}
