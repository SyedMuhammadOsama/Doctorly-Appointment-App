import 'package:doctorly/models/parsed/sign_in_api_parsed.dart';
import 'package:doctorly/models/parsed/sign_up_api_parsed.dart';
import 'package:flutter/cupertino.dart';

class SigUpState extends ChangeNotifier {
  SignUpApiParsed? signUpStateData;
  updateState(SignUpApiParsed? data) {
    signUpStateData = data;
    notifyListeners();
  }
}
