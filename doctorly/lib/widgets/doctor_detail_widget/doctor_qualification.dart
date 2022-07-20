import 'package:flutter/material.dart';

class DoctorQualification extends StatelessWidget {
  const DoctorQualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      margin: const EdgeInsets.only(left: 25, bottom: 10),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '• Qualification',
            style: TextStyle(fontSize: 17, wordSpacing: 1.5),
          ),
        ),
      ),
    );
  }
}
