import 'package:doctorly/widgets/doctor_detail_widget/mix_card_row.dart';

import '/widgets/bottom_navigation_button.dart';
import '/widgets/doctor_detail_widget/about_doctor.dart';
import '/widgets/doctor_detail_widget/doctor_image_container.dart';
import '/widgets/doctor_detail_widget/doctor_info.dart';
import '/widgets/doctor_detail_widget/doctor_qualification.dart';
import '/widgets/doctor_detail_widget/separator_bar.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 244, 244),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                children: [
                  DoctorImageContainer(),
                  DoctorInfo(),
                  MixCardRow(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: Text(
                'Qualification:',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            DoctorQualification(),
            const SeparatorBar(),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: Text(
                'Working Time:',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, bottom: 10),
              child: Text(
                '9.00 am - 12.00 pm',
                style: TextStyle(fontSize: 17, height: 1.5, wordSpacing: 1.5),
              ),
            ),
            const SeparatorBar(),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: Text(
                'About:',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            AboutDoctor(),
            const BottomNavigationButton()
          ],
        ),
      ),
    );
  }
}
