import 'package:doctorly/widgets/slot_booking_widgets/patient_details_widget.dart';

import '/screens/doctor_details_screen.dart';
import '/widgets/doctor_detail_widget/doctor_image_container.dart';

import '/screens/doctor_by_category_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PatientDetailsWidget(),
    );
  }
}
