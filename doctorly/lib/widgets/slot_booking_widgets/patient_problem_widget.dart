import 'package:flutter/material.dart';

class PatientProblemWidget extends StatelessWidget {
  const PatientProblemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: TextField(
          maxLength: 200,
          maxLines: 5,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(25),
            hintText: 'Write Symptoms',
            hintStyle: const TextStyle(color: Color(0xFF9B8F8F), fontSize: 20),
            // fillColor: const Color(0xFF131212),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 176, 101, 189),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 176, 101, 189),
                )),
          ),
        ));
  }
}
