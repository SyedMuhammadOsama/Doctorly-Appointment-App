// ignore_for_file: must_be_immutable

import '/models/state/sign_up_state.dart';
import '/models/user_http_class.dart';
import '/screens/Signin_screen.dart';
import '/widgets/bottom_navigation_button.dart';

import '/widgets/headline_text.dart';
import '/widgets/signup_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = 'SignUpScreen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Builder(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
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
                const Spacer(),
                BottomNavigationButton('Sign Up', () async {
                  if (Form.of(context)?.validate() ?? false) {
                    var signUpResponse = await UserHttpClass().signUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text);
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
                      Text('Already have an account?',
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          },
                          child: Text(
                            'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.merge(TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
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
