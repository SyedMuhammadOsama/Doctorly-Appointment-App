import 'package:doctorly/widgets/slot_booking_widgets/int_field_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/models/state/create_appointment_state.dart';
import '/models/state/reg_patient_state.dart';
import '/models/state/slots_state.dart';
import '/models/user_http_class.dart';
import '/screens/successful_appointment_screen.dart';

import '/widgets/headline_text.dart';
import '/widgets/signup_widgets/text_form_field_widget.dart';
import '/widgets/slot_booking_widgets/patient_problem_widget.dart';
import '/widgets/slot_booking_widgets/radio_button_widget.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../bottom_navigation_button.dart';

class PatientDetailsWidget extends StatefulWidget {
  const PatientDetailsWidget({Key? key}) : super(key: key);

  @override
  State<PatientDetailsWidget> createState() => _PatientDetailsWidgetState();
}

class _PatientDetailsWidgetState extends State<PatientDetailsWidget> {
  String? gender;

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController sympController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
          child: Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadlineTextWidget(
                    'Patient Name',
                    top: 10,
                  ),
                  TextFormFieldWidget(
                    controller: nameController,
                    hint: 'Talha Khan',
                    validator: (textValue) {
                      if (textValue!.isEmpty) {
                        return 'Please enter patient name';
                      }
                      return null;
                    },
                  ),
                  const HeadlineTextWidget(
                    'Age',
                    top: 10,
                  ),
                  IntFieldWidget(
                    controller: ageController,
                    hint: '25',
                    validator: (textValue) {
                      if (textValue!.isEmpty) {
                        return 'Please enter age';
                      }
                      return null;
                    },
                  ),
                  const HeadlineTextWidget(
                    'Gender',
                    top: 10,
                  ),
                  RadioButtonWidget(
                    gender,
                    (String? value) => setState(
                      () {
                        gender = value;
                      },
                    ),
                  ),
                  const HeadlineTextWidget(
                    'Symptoms',
                    top: 10,
                  ),
                  PatientProblemWidget(
                    validator: (textValue) {
                      if (textValue!.isEmpty) {
                        return 'Please enter symptoms';
                      }
                      return null;
                    },
                    controller: sympController,
                    hint: 'Write Symptomps',
                  ),
                  BottomNavigationButton(
                    'Set Appointment',
                    () async {
                      if (Provider.of<SlotsState>(context, listen: false)
                                  .selectedSlotId ==
                              null ||
                          Provider.of<SlotsState>(context, listen: false)
                                  .selectedSlotId ==
                              -1) {
                        Fluttertoast.showToast(
                            msg: "Please select your slot",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54);
                      } else if ((Form.of(context)?.validate() ?? false) &&
                          gender != null &&
                          Provider.of<SlotsState>(context, listen: false)
                                  .selectedSlotId !=
                              null &&
                          Provider.of<SlotsState>(context, listen: false)
                                  .selectedSlotId !=
                              -1) {
                        var response1 = await UserHttpClass().postPatient(
                            context: context,
                            name: nameController.text,
                            age: ageController.text,
                            symp: sympController.text,
                            gender: gender);
                        Provider.of<RegPatientState>(context, listen: false)
                            .updateState(response1);
                        var response2 =
                            await UserHttpClass().createAppointment(context);
                        Provider.of<CreateAppointmentState>(context,
                                listen: false)
                            .updateState(response2);
                        Provider.of<SlotsState>(context, listen: false)
                            .setSlotId(-1);
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            SuccessfulAppointmentScreen.routeName,
                            (Route<dynamic> route) => false);
                      }
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
