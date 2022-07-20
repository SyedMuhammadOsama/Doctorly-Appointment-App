import 'package:doctorly/models/parsed/slots_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class SlotsState extends ChangeNotifier {
  SlotsApiParsed? slotsStateData;
  int? selectedSlotId;
  updateState(SlotsApiParsed? data) {
    slotsStateData = data;
    notifyListeners();
  }

  setSlotId(int? id) {
    selectedSlotId = id;
    notifyListeners();
  }
}
