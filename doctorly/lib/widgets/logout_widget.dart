import '/screens/Signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/state/sign_in_state.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future logout() async {
      try {
        var url = Uri.parse(
            'http://doctorlyapi.japaneast.cloudapp.azure.com/auth/logout');
        await http.put(url, headers: {
          'Authorization':
              'Bearer ${Provider.of<SignInState>(context, listen: false).loginDataState?.token}'
        });
      } catch (e) {
        print(e);
      }
    }

    return Card(
      shadowColor: Theme.of(context).primaryColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          onTap: () async {
            await logout();
            Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName,
                (Route<dynamic> route) => false);
          },
          title: Text('Logout', style: Theme.of(context).textTheme.bodyLarge),
          leading: Icon(
            Icons.logout_outlined,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
