import 'dart:convert';

import 'package:doctorly/drawer/drawer_widget.dart';
import 'package:doctorly/models/parsed/doctors_api_parsed.dart';
import 'package:doctorly/models/parsed/specialization_api_parsed.dart';
import 'package:doctorly/models/state/pop_doctors_state.dart';
import 'package:doctorly/models/state/sign_in_state.dart';
import 'package:doctorly/models/state/specialization_state.dart';
import 'package:doctorly/screens/doctor_details_screen.dart';
import 'package:doctorly/widgets/headline_text.dart';
import 'package:provider/provider.dart';

import '/widgets/home_page_widgets/categories_item.dart';
import '/widgets/home_page_widgets/categories_row.dart';
import '/widgets/home_page_widgets/display_image_container.dart';
import '/widgets/grid_view_widget.dart';
import '../widgets/textfieldwidget.dart';

import '/widgets/doctor_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'doctor_by_category_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  call() async {
    var spec = await getSpec();
    var popDoct = await getPopDoctors();
    await Provider.of<SpecializationState>(context, listen: false)
        .updateState(spec);

    await Provider.of<PopDoctorsState>(context, listen: false)
        .updateState(popDoct);
  }

  @override
  void didChangeDependencies() async {
    await call();
    super.didChangeDependencies();
  }

  Future<DoctorsApiParsed?> getPopDoctors() async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/doctors/popular/doctors');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      var popDoctResponse = DoctorsApiParsed.fromJson(decodedJson);
      print(decodedJson);
      return popDoctResponse;
    } catch (e) {
      print(e);
    }
  }

  Future<SpecializationApiParsed?> getSpec() async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/misc/specializations');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      var specResponse = SpecializationApiParsed.fromJson(decodedJson);
      print(decodedJson);
      return specResponse;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
              Provider.of<SignInState>(context).loginDataState?.token ?? '')),
      drawer: DrawerWidget(),
      body: ListView(
        shrinkWrap: true,
        children: [
          const DisplayImageContainer(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: HeadlineTextWidget('Categories')
              //  Text(
              //   'Categories',
              //   style: Theme.of(context).textTheme.headline6?.merge(
              //         TextStyle(),
              //       ),
              // ),
              ),
          FutureBuilder(
            future: getSpec(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  height: 135,
                  child: ListView.builder(
                    itemCount: Provider.of<SpecializationState>(context)
                        .specializationStateData
                        ?.data
                        ?.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => Container(
                          margin: const EdgeInsets.all(10),
                          child: Categoriesitem(
                            categoryImage: Provider.of<SpecializationState>(
                                        context)
                                    .specializationStateData
                                    ?.data?[index]
                                    .image ??
                                'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                            categoryText:
                                Provider.of<SpecializationState>(context)
                                        .specializationStateData
                                        ?.data?[index]
                                        .name ??
                                    '',
                            navigator: () {
                              Navigator.pushNamed(
                                  context, DoctorByCatScreen.routeName,
                                  arguments: {
                                    'specId': Provider.of<SpecializationState>(
                                            context,
                                            listen: false)
                                        .specializationStateData
                                        ?.data?[index]
                                        .id
                                  });
                            },
                          ),
                        )),
                  ),
                );
              }
            },
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: HeadlineTextWidget('Popular Doctors')
              // Text(
              //   'Popular Doctors',
              //   style: Theme.of(context).textTheme.headline6?.merge(
              //         TextStyle(
              //           color: Color.fromARGB(255, 176, 101, 189),
              //         ),
              //       ),
              // ),
              ),
          FutureBuilder(
            future: getPopDoctors(),
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
                  itemCount: Provider.of<PopDoctorsState>(context)
                          .popDoctorsDataState
                          ?.data
                          ?.length ??
                      0,
                  itemBuilder: ((context, index) => DoctorContainer(
                      doctorImage: Provider.of<PopDoctorsState>(context)
                              .popDoctorsDataState
                              ?.data?[index]
                              .image ??
                          'https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg',
                      doctorName: Provider.of<PopDoctorsState>(context)
                              .popDoctorsDataState
                              ?.data?[index]
                              .user
                              ?.name ??
                          '',
                      categoryName: Provider.of<PopDoctorsState>(context)
                              .popDoctorsDataState
                              ?.data?[index]
                              .specializations
                              ?.name ??
                          '',
                      qualification: Provider.of<PopDoctorsState>(context)
                              .popDoctorsDataState
                              ?.data?[index]
                              .qualifications
                              ?.qualificationName
                              ?.first ??
                          '',
                      navigator: () {
                        Navigator.pushNamed(
                            context, DoctorDetailsScreen.routeName,
                            arguments: {
                              'doctId': Provider.of<PopDoctorsState>(context,
                                      listen: false)
                                  .popDoctorsDataState
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
