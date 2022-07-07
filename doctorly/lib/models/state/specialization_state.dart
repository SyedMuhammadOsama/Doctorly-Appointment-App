import 'package:doctorly/models/parsed/specialization_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class SpecializationState extends ChangeNotifier {
  SpecializationApiParsed? specializationStateData;
  updateState(SpecializationApiParsed? data) {
    specializationStateData = data;
    notifyListeners();
  }
}
