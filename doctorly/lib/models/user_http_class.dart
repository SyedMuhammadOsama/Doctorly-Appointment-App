import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:fluttertoast/fluttertoast.dart';

import 'parsed/create_appointment_api_parsed.dart';
import 'parsed/doct_by_id_api_parsed.dart';
import 'parsed/doctors_api_parsed.dart';
import 'parsed/patient_history_api_parsed.dart';
import 'parsed/reg_patient_api_parsed.dart';
import 'parsed/sign_in_api_parsed.dart';
import 'parsed/sign_up_api_parsed.dart';
import 'parsed/slots_api_parsed.dart';
import 'parsed/specialization_api_parsed.dart';
import 'state/reg_patient_state.dart';
import 'state/sign_in_state.dart';
import 'state/slots_state.dart';

class UserHttpClass {
  Future<SignUpApiParsed?> signUp(
      {required email, required name, required password}) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/users/register');

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'name': name,
            'email': email,
            'password': password,
            'role': 'user',
          }));
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var signUpResponse = SignUpApiParsed.fromJson(decodedJson);

        return signUpResponse;
      }
    } catch (e) {}
  }

  Future<SignInApiParsed?> login({required email, required password}) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/auth/get_token');
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$email:$password'));
      var response = await http
          .post(url, headers: <String, String>{'authorization': basicAuth});
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var loginResponse = SignInApiParsed.fromJson(decodedJson);

        return loginResponse;
      } else {
        Fluttertoast.showToast(
            msg: "Email or password is incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54);
      }
    } catch (e) {}
  }

  Future<DoctorsApiParsed?> getPopDoctors(context) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/doctors/popular/doctors');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var popDoctResponse = DoctorsApiParsed.fromJson(decodedJson);

        return popDoctResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<SpecializationApiParsed?> getSpec(context) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/misc/specializations');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var specResponse = SpecializationApiParsed.fromJson(decodedJson);

        return specResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<DoctorsApiParsed?> getDoctByCat(
      {required context, required specId, text}) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/misc/search/sp/${specId}?name=$text');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var doctByCatResponse = DoctorsApiParsed.fromJson(decodedJson);
        print(decodedJson);
        return doctByCatResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<DoctByIdApiParsed?> getDoctorDetails(context, doctId) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/doctors/get/$doctId');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var doctDetailsResponse = DoctByIdApiParsed.fromJson(decodedJson);

        return doctDetailsResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<SlotsApiParsed?> getSlots(context, doctId) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/doctors/timings/$doctId');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var doctorSLotsResponse = SlotsApiParsed.fromJson(decodedJson);

        return doctorSLotsResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<PatientHistoryApiParsed?> getHistory(context) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/patient/appointment/history');
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
      });
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var specResponse = PatientHistoryApiParsed.fromJson(decodedJson);

        return specResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<RegPatientApiParsed?> postPatient(
      {required context,
      required name,
      required age,
      required symp,
      required gender}) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/patient/new');

      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            'Authorization':
                'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
          },
          body: json.encode({
            'name': name,
            'age': age,
            'symptoms': symp,
            'gender': gender,
          }));
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var patientResponse = RegPatientApiParsed.fromJson(decodedJson);

        return patientResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<CreateAppointmentApiParsed?> createAppointment(context) async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/patient/new_appointment');

      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            'Authorization':
                'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
          },
          body: json.encode({
            'slot_id':
                Provider.of<SlotsState>(context, listen: false).selectedSlotId,
            'patient_id': Provider.of<RegPatientState>(context, listen: false)
                .regPatientStateData
                ?.id,
          }));
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        var newAppointmentResponse =
            CreateAppointmentApiParsed.fromJson(decodedJson);

        return newAppointmentResponse;
      }
    } catch (e) {
      print(e);
    }
  }
}
