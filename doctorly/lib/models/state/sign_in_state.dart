import 'package:flutter/material.dart';

import '../parsed/sign_in_api_parsed.dart';

class SignInState extends ChangeNotifier {
  SignInApiParsed? loginDataState;

  updateState(SignInApiParsed? loginData) {
    loginDataState = loginData;
    notifyListeners();
  }
}
