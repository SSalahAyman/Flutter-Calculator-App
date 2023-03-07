import 'package:calculatorapp/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculatorapp());
}

class Calculatorapp extends StatelessWidget {
  const Calculatorapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
