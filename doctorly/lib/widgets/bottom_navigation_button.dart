import 'package:doctorly/widgets/customized_text_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  BottomNavigationButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              const Color.fromARGB(255, 226, 30, 233)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: CustomizedTextWidget(
            text,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
