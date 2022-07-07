import 'package:doctorly/models/parsed/sign_in_api_parsed.dart';
import 'package:doctorly/models/state/sign_in_state.dart';
import 'package:doctorly/screens/home_page.dart';
import 'package:doctorly/screens/signup_screen.dart';
import 'package:doctorly/widgets/bottom_navigation_button.dart';
import 'package:doctorly/widgets/customized_text_widget.dart';
import 'package:doctorly/widgets/headline_text.dart';
import 'package:doctorly/widgets/signup_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Future<SignInApiParsed?> login() async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/auth/get_token');
      String basicAuth = 'Basic ' +
          base64.encode(utf8
              .encode('${emailController.text}:${passwordController.text}'));
      var response = await http
          .post(url, headers: <String, String>{'authorization': basicAuth});
      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      var loginResponse = SignInApiParsed.fromJson(decodedJson);

      print(decodedJson);
      print(loginResponse.token);

      return loginResponse;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadlineTextWidget(
                    'Email',
                    left: 30,
                  ),
                  TextFormFieldWidget(
                    validator: (textValue) {
                      if (!(textValue!.contains('@')) || textValue.isEmpty) {
                        return 'Please enter valid informaton';
                      }
                      return null;
                    },
                    hint: 'abc@email.com',
                    controller: emailController,
                  ),
                  const HeadlineTextWidget(
                    'Password',
                    left: 30,
                  ),
                  TextFormFieldWidget(
                    validator: (textValue) {
                      if (textValue!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    hint: '******',
                    controller: passwordController,
                  ),
                ],
              ),
              const Spacer(),
              BottomNavigationButton('Sign In', () async {
                if (Form.of(context)?.validate() ?? false) {
                  var loginResponse = await login();
                  Provider.of<SignInState>(context, listen: false)
                      .updateState(loginResponse);
                  Navigator.pushNamed(context, HomePage.routeName);
                }
              }),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomizedTextWidget(
                      "Don't have an account?",
                      fontSize: 18,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: CustomizedTextWidget(
                          'Sign Up',
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
