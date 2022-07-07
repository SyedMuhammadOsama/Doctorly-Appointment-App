import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String? Function(String?)? validator;
  final String hint;
  final TextEditingController controller;
  TextFormFieldWidget(
      {required this.validator, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
        child: TextFormField(
          controller: controller,
          validator: validator,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(25),
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9B8F8F), fontSize: 20),
            // fillColor: const Color(0xFF131212),
            filled: true,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ));
  }
}
