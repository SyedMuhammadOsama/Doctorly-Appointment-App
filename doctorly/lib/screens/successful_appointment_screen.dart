import '/screens/home_page.dart';
import '/widgets/bottom_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/state/create_appointment_state.dart';

class SuccessfulAppointmentScreen extends StatelessWidget {
  static const routeName = 'SuccessfulAppointmentScreen';
  const SuccessfulAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: ClipRRect(
              child: Image.asset(
                "assets/message.png",
                width: 250,
              ),
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.all(20),
            child: Text(
              'Appointment number: ${Provider.of<CreateAppointmentState>(context).createAppointmentStateData?.timings?.slot?.id}\nExpected timings: ${Provider.of<CreateAppointmentState>(context).createAppointmentStateData?.expectedTime}',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.merge(const TextStyle(color: Colors.grey, height: 1.3)),
            ),
          ),
          const Spacer(),
          BottomNavigationButton('Go to Home', () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (Route<dynamic> route) => false);
          })
        ],
      ),
    );
  }
}
