// ignore_for_file: must_be_immutable, file_names

import '/models/state/sign_in_state.dart';
import '/models/user_http_class.dart';
import '/screens/home_page.dart';
import '/screens/signup_screen.dart';
import '/widgets/bottom_navigation_button.dart';

import '/widgets/headline_text.dart';
import '/widgets/signup_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = 'SignInScreen';

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Builder(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline4,
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
                  var loginResponse = await UserHttpClass().login(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  Provider.of<SignInState>(context, listen: false)
                      .updateState(loginResponse);
                  if (loginResponse != null) {
                    Navigator.pushNamed(context, HomePage.routeName);
                  }
                }
              }),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Text('Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.merge(TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                )))),
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
