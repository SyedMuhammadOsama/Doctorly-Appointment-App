import '/drawer/drawer_widget.dart';

import '/models/state/pop_doctors_state.dart';

import '/models/state/specialization_state.dart';
import '/models/user_http_class.dart';
import '/screens/doctor_details_screen.dart';
import '/widgets/headline_text.dart';
import 'package:provider/provider.dart';

import '../models/state/doct_by_cat_state.dart';
import '../models/state/doct_by_id_state.dart';
import '../models/state/slots_state.dart';
import '../widgets/doctor_container.dart';
import '../widgets/home_page_widgets/display_image_container.dart';
import '/widgets/home_page_widgets/categories_item.dart';

import 'package:flutter/material.dart';

import 'doctor_by_category_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  call() async {
    var spec = await UserHttpClass().getSpec(context);
    var popDoct = await UserHttpClass().getPopDoctors(context);
    await Provider.of<SpecializationState>(context, listen: false)
        .updateState(spec);

    await Provider.of<PopDoctorsState>(context, listen: false)
        .updateState(popDoct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Doctorly')),
      drawer: const DrawerWidget(),
      body: ListView(
        shrinkWrap: true,
        children: [
          const DisplayImageContainer(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const HeadlineTextWidget('Categories')),
          FutureBuilder(
            future: call(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SizedBox(
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
                            navigator: () async {
                              var doct = await UserHttpClass().getDoctByCat(
                                  context: context,
                                  specId: Provider.of<SpecializationState>(
                                          context,
                                          listen: false)
                                      .specializationStateData
                                      ?.data?[index]
                                      .id);

                              await Provider.of<DoctByCatState>(context,
                                      listen: false)
                                  .updateState(doct);

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
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const HeadlineTextWidget('Popular Doctors')),
          FutureBuilder(
            future: call(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
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
                      navigator: () async {
                        var doctById = await UserHttpClass().getDoctorDetails(
                            context,
                            Provider.of<PopDoctorsState>(context, listen: false)
                                .popDoctorsDataState
                                ?.data?[index]
                                .id);
                        await Provider.of<DoctByIdState>(context, listen: false)
                            .updateState(doctById);
                        Navigator.pushNamed(
                          context,
                          DoctorDetailsScreen.routeName,
                        );
                        var response = await UserHttpClass().getSlots(
                            context,
                            Provider.of<PopDoctorsState>(context, listen: false)
                                .popDoctorsDataState
                                ?.data?[index]
                                .id);
                        Provider.of<SlotsState>(context, listen: false)
                            .updateState(response);
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
