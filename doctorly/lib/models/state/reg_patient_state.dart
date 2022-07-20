import 'package:doctorly/models/parsed/reg_patient_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class RegPatientState extends ChangeNotifier {
  RegPatientApiParsed? regPatientStateData;
  updateState(RegPatientApiParsed? data) {
    regPatientStateData = data;
    notifyListeners();
  }
}
