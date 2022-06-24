import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  String? gender;

  RadioButtonWidget(this.gender);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  onChanged() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String?>(
          title: const Text('Male'),
          value: 'Male',
          groupValue: widget.gender,
          onChanged: (String? value) => setState(
            () {
              widget.gender = value;
            },
          ),
        ),
        RadioListTile<String?>(
          title: const Text('Female'),
          value: 'Female',
          groupValue: widget.gender,
          onChanged: (String? value) => setState(
            () {
              widget.gender = value;
            },
          ),
        )
      ],
    );
  }
}
