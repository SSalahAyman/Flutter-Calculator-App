import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Color textcolor;
  String textstring;
  Color backgroundcolor;
  VoidCallback? ontap;
  late double width;
  late double height;
  MyButton(
      {super.key,
      required this.textcolor,
      required this.textstring,
      required this.backgroundcolor,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: backgroundcolor,
            child: Center(
              child: Text(
                textstring,
                style: TextStyle(color: textcolor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
