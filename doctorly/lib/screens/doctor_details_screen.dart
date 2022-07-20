import '/models/state/doct_by_id_state.dart';

import '/screens/slot_booking_screen.dart';
import '/widgets/doctor_detail_widget/mix_card_row.dart';
import '/widgets/headline_text.dart';
import 'package:provider/provider.dart';

import '../widgets/doctor_detail_widget/doctor_image_container.dart';
import '/widgets/bottom_navigation_button.dart';
import '/widgets/doctor_detail_widget/about_doctor.dart';

import '/widgets/doctor_detail_widget/doctor_info.dart';

import '/widgets/doctor_detail_widget/separator_bar.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  static const routeName = 'DoctorDetailsScreen';

  const DoctorDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 248, 244, 244),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                children: const [
                  DoctorImageContainer(),
                  DoctorInfo(),
                  MixCardRow(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: const HeadlineTextWidget(
                'Qualification:',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, bottom: 10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Provider.of<DoctByIdState>(context)
                    .doctByIdStateData
                    ?.qualifications
                    ?.qualificationName
                    ?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '• ${Provider.of<DoctByIdState>(context).doctByIdStateData?.qualifications?.qualificationName?[index]}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.merge(const TextStyle(wordSpacing: 1.5)),
                  ),
                ),
              ),
            ),
            const SeparatorBar(),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: const HeadlineTextWidget(
                'About:',
              ),
            ),
            const AboutDoctor(),
            BottomNavigationButton('Book Appointment', () {
              Navigator.pushNamed(context, SlotBookingScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
}
