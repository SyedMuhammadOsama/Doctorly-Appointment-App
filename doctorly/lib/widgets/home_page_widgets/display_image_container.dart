import 'package:flutter/material.dart';

class DisplayImageContainer extends StatelessWidget {
  const DisplayImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      height: 200,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/homepage.jpg",
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
