// ignore_for_file: must_be_immutable

import 'package:doctorly/models/state/doct_by_id_state.dart';

import '/models/state/doct_by_cat_state.dart';
import '/models/user_http_class.dart';
import '/screens/doctor_details_screen.dart';
import 'package:provider/provider.dart';

import '../models/state/slots_state.dart';
import '../widgets/doctor_container.dart';
import '../widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

class DoctorByCatScreen extends StatelessWidget {
  static const routeName = 'DoctorByCatScreen';

  TextEditingController searchController = TextEditingController();

  DoctorByCatScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Doctors By Category'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          TextFieldWidget(
            controller: searchController,
            onPressed: () {},
          ),
          GridView.builder(
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
                navigator: () async {
                  var doctById = await UserHttpClass().getDoctorDetails(
                      context,
                      Provider.of<DoctByCatState>(context, listen: false)
                          .doctByCatStateData
                          ?.data?[index]
                          .id);
                  Provider.of<DoctByIdState>(context, listen: false)
                      .updateState(doctById);
                  Navigator.pushNamed(
                    context,
                    DoctorDetailsScreen.routeName,
                  );
                  var response = await UserHttpClass().getSlots(
                      context,
                      Provider.of<DoctByCatState>(context, listen: false)
                          .doctByCatStateData
                          ?.data?[index]
                          .id);
                  Provider.of<SlotsState>(context, listen: false)
                      .updateState(response);
                })),
          )
        ],
      ),
    );
  }
}
