import 'package:doctorly/models/parsed/doctors_api_parsed.dart';
import 'package:flutter/material.dart';

class DoctByCatState extends ChangeNotifier {
  DoctorsApiParsed? doctByCatStateData;
  updateState(DoctorsApiParsed? data) {
    doctByCatStateData = data;
    notifyListeners();
  }
}
