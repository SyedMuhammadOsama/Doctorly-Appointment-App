import 'dart:convert';

import 'package:doctorly/models/parsed/doct_by_id_api_parsed.dart';
import 'package:doctorly/models/state/doct_by_id_state.dart';
import 'package:doctorly/screens/slot_booking_screen.dart';
import 'package:doctorly/widgets/doctor_detail_widget/mix_card_row.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../models/state/sign_in_state.dart';
import '/widgets/bottom_navigation_button.dart';
import '/widgets/doctor_detail_widget/about_doctor.dart';
import '/widgets/doctor_detail_widget/doctor_image_container.dart';
import '/widgets/doctor_detail_widget/doctor_info.dart';
import '/widgets/doctor_detail_widget/doctor_qualification.dart';
import '/widgets/doctor_detail_widget/separator_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorDetailsScreen extends StatefulWidget {
  static const routeName = 'DoctorDetailsScreen';

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  call() async {
    var doctById = await getDoctorDetails();
    await Provider.of<DoctByIdState>(context, listen: false)
        .updateState(doctById);
  }

  @override
  void didChangeDependencies() {
    call();
    super.didChangeDependencies();
  }

  Future<DoctByIdApiParsed?> getDoctorDetails() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/doctors/get/${args['doctId']}');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      var doctDetailsResponse = DoctByIdApiParsed.fromJson(decodedJson);
      print(decodedJson);
      return doctDetailsResponse;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Details'),
      ),
      body: FutureBuilder(
          future: getDoctorDetails(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
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
                    Container(
                      margin: EdgeInsets.only(left: 25, bottom: 10),
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
                            style: TextStyle(fontSize: 17, wordSpacing: 1.5),
                          ),
                        ),
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
                    BottomNavigationButton('Book Appointment', () {
                      Navigator.pushNamed(context, SlotBookingScreen.routeName);
                    })
                  ],
                ),
              );
            }
          }),
    );
  }
}
