import 'package:doctorly/widgets/TextFieldWidget.dart';
import 'package:doctorly/widgets/customized_text_widget.dart';
import 'package:doctorly/widgets/headline_text.dart';
import 'package:doctorly/widgets/slot_booking_widgets/patient_problem_widget.dart';
import 'package:doctorly/widgets/slot_booking_widgets/radio_button_widget.dart';
import 'package:flutter/material.dart';

class PatientDetailsWidget extends StatefulWidget {
  @override
  State<PatientDetailsWidget> createState() => _PatientDetailsWidgetState();
}

class _PatientDetailsWidgetState extends State<PatientDetailsWidget> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadlineTextWidget(
              'Patient Name',
              top: 10,
            ),
            TextFieldWidget(),
            HeadlineTextWidget(
              'Age',
              top: 10,
            ),
            TextFieldWidget(),
            HeadlineTextWidget(
              'Gender',
              top: 10,
            ),
            RadioButtonWidget(gender),
            HeadlineTextWidget(
              'Symptoms',
              top: 10,
            ),
            PatientProblemWidget()
          ],
        ),
      ),
    );
  }
}
