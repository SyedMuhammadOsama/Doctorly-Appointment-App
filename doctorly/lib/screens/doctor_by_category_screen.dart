import 'dart:convert';

import 'package:doctorly/models/parsed/doctors_api_parsed.dart';
import 'package:doctorly/models/state/doct_by_cat_state.dart';
import 'package:doctorly/screens/doctor_details_screen.dart';
import 'package:provider/provider.dart';

import '../models/state/sign_in_state.dart';
import '../widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

import '../widgets/doctor_container.dart';
import '../widgets/grid_view_widget.dart';
import 'package:http/http.dart' as http;

class DoctorByCatScreen extends StatefulWidget {
  static const routeName = 'DoctorByCatScreen';

  @override
  State<DoctorByCatScreen> createState() => _DoctorByCatScreenState();
}

class _DoctorByCatScreenState extends State<DoctorByCatScreen> {
  call() async {
    var doct = await getDoctByCat();

    await Provider.of<DoctByCatState>(context, listen: false).updateState(doct);
  }

  @override
  void didChangeDependencies() async {
    await call();
    super.didChangeDependencies();
  }

  Future<DoctorsApiParsed?> getDoctByCat() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/misc/doctors/specialization/${args['specId']}');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      var doctByCatResponse = DoctorsApiParsed.fromJson(decodedJson);
      print(decodedJson);
      return doctByCatResponse;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Doctors By Category'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          TextFieldWidget(),
          FutureBuilder(
            future: getDoctByCat(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 4 / 5,
                  ),
                  itemCount: Provider.of<DoctByCatState>(context)
                          .doctByCatStateData
                          ?.data
                          ?.length ??
                      0,
                  itemBuilder: ((context, index) => DoctorContainer(
                      doctorImage: Provider.of<DoctByCatState>(context)
                              .doctByCatStateData
                              ?.data?[index]
                              .image ??
                          'https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg',
                      doctorName: Provider.of<DoctByCatState>(context)
                              .doctByCatStateData
                              ?.data?[index]
                              .user
                              ?.name ??
                          '',
                      categoryName: Provider.of<DoctByCatState>(context)
                              .doctByCatStateData
                              ?.data?[index]
                              .specializations
                              ?.name ??
                          '',
                      qualification: Provider.of<DoctByCatState>(context)
                              .doctByCatStateData
                              ?.data?[index]
                              .qualifications
                              ?.qualificationName
                              ?.first ??
                          '',
                      navigator: () {
                        Navigator.pushNamed(
                            context, DoctorDetailsScreen.routeName,
                            arguments: {
                              'doctId': Provider.of<DoctByCatState>(context,
                                      listen: false)
                                  .doctByCatStateData
                                  ?.data?[index]
                                  .id
                            });
                      })),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
