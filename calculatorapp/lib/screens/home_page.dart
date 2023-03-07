import 'package:calculatorapp/components/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double width;
  late double height;
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
    "ANS",
    "=",
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
            width: width,
            height: height * 0.36,
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
                if (index == 0) {
                  return MyButton(
                      textcolor: Colors.white,
                      textstring: "C",
                      backgroundcolor: Colors.green);
                } else if (index == 1) {
                  return MyButton(
                      textcolor: Colors.white,
                      textstring: "DEL",
                      backgroundcolor: Colors.red);
                } else {
                  return MyButton(
                      textcolor: isoperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                      textstring: buttons[index],
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
}

bool isoperator(String x) {
  if (x == "%" ||
      x == "/" ||
      x == "x" ||
      x == "-" ||
      x == "+" ||
      x == "/" ||
      x == "=") {
    return true;
  }
  return false;
}
