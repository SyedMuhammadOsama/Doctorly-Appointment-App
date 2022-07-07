import 'dart:convert';

import 'package:doctorly/models/parsed/sign_up_api_parsed.dart';
import 'package:doctorly/models/state/sign_up_state.dart';
import 'package:doctorly/screens/Signin_screen.dart';
import 'package:doctorly/widgets/bottom_navigation_button.dart';
import 'package:doctorly/widgets/customized_text_widget.dart';
import 'package:doctorly/widgets/headline_text.dart';
import 'package:doctorly/widgets/signup_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = 'SignUpScreen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<SignUpApiParsed?> signUp() async {
    try {
      var url = Uri.parse(
          'http://doctorlyapi.japaneast.cloudapp.azure.com/users/register');

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'name': nameController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'role': 'user',
          }));
      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      var signUpResponse = SignUpApiParsed.fromJson(decodedJson);
      print(decodedJson);
      return signUpResponse;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Builder(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),

                const HeadlineTextWidget(
                  'Name',
                  left: 30,
                ),
                TextFormFieldWidget(
                  validator: (textValue) {
                    if (textValue!.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                  hint: 'Talha Khan',
                  controller: nameController,
                ),

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

                // ElevatedButton(
                //   onPressed: () async {
                //     if (Form.of(context)?.validate() ?? false) {
                //       var loginResponse = await login();
                //       // Provider.of<LoginState>(context, listen: false)
                //       //     .updateState(loginResponse);

                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) =>
                //               CategoriesScreen(loginResponse?.token),
                //         ),
                //       );
                //     }
                //   },
                //   child: const Text('save'),
                // ),

                const Spacer(),
                BottomNavigationButton('Sign Up', () async {
                  if (Form.of(context)?.validate() ?? false) {
                    var signUpResponse = await signUp();
                    Provider.of<SigUpState>(context, listen: false)
                        .updateState(signUpResponse);
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  }
                }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomizedTextWidget(
                        'Already have an account?',
                        fontSize: 18,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: CustomizedTextWidget(
                          'Sign In',
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
