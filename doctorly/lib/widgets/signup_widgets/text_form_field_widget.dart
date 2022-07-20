// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String? Function(String?)? validator;
  final String hint;
  final TextEditingController controller;
  TextFormFieldWidget(
      {Key? key,
      required this.validator,
      required this.hint,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
        child: TextFormField(
          controller: controller,
          validator: validator,
          style: Theme.of(context).textTheme.bodyLarge?.merge(const TextStyle(
                color: Colors.black,
              )),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.merge(const TextStyle(color: Color(0xFF9B8F8F))),
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
