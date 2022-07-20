// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  String? gender;
  Function(String?)? onChanged;
  RadioButtonWidget(this.gender, this.onChanged, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String?>(
          title: Text(
            'Male',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          value: 'Male',
          groupValue: gender,
          onChanged: onChanged,
        ),
        RadioListTile<String?>(
            title: Text(
              'Female',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: 'Female',
            groupValue: gender,
            onChanged: onChanged)
      ],
    );
  }
}
