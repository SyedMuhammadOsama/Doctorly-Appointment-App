import 'package:doctorly/models/parsed/create_appointment_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class CreateAppointmentState extends ChangeNotifier {
  CreateAppointmentApiParsed? createAppointmentStateData;
  updateState(CreateAppointmentApiParsed? data) {
    createAppointmentStateData = data;
    notifyListeners();
  }
}
