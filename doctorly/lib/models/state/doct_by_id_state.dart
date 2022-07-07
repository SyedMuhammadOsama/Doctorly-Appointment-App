import 'package:doctorly/models/parsed/doct_by_id_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class DoctByIdState extends ChangeNotifier {
  DoctByIdApiParsed? doctByIdStateData;
  updateState(DoctByIdApiParsed? data) {
    doctByIdStateData = data;
    notifyListeners();
  }
}
