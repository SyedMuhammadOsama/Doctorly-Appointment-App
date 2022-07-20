import 'package:flutter/material.dart';

class PatientProblemWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  const PatientProblemWidget(
      {Key? key,
      required this.validator,
      required this.controller,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: TextFormField(
          controller: controller,
          validator: validator,
          maxLength: 200,
          maxLines: 5,
          style: Theme.of(context).textTheme.bodyLarge?.merge(const TextStyle(
                color: Colors.black,
              )),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            hintText: 'Write Symptoms',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.merge(const TextStyle(color: Color(0xFF9B8F8F))),
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
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 176, 101, 189),
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 176, 101, 189),
                )),
          ),
        ));
  }
}
