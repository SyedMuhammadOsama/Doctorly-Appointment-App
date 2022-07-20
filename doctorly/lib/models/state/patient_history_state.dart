import 'package:doctorly/models/parsed/patient_history_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class PatientHistoryState extends ChangeNotifier {
  PatientHistoryApiParsed? patientHistoryStateData;
  updateState(PatientHistoryApiParsed? data) {
    patientHistoryStateData = data;
    notifyListeners();
  }
}
