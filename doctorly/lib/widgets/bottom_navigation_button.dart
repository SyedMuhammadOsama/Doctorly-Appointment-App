// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  BottomNavigationButton(this.text, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              const Color.fromARGB(255, 226, 30, 233)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(text,
              style:
                  Theme.of(context).textTheme.bodyLarge?.merge(const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))),
        ),
      ),
    );
  }
}
