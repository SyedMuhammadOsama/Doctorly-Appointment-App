import 'package:doctorly/models/parsed/doctors_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class PopDoctorsState extends ChangeNotifier {
  DoctorsApiParsed? popDoctorsDataState;
  updateState(DoctorsApiParsed? data) {
    popDoctorsDataState = data;
    notifyListeners();
  }
}
