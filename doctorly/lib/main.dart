import 'package:doctorly/models/state/doct_by_cat_state.dart';
import 'package:doctorly/models/state/doct_by_id_state.dart';
import 'package:doctorly/models/state/pop_doctors_state.dart';
import 'package:doctorly/models/state/sign_up_state.dart';
import 'package:doctorly/models/state/specialization_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/state/sign_in_state.dart';
import '/screens/Signin_screen.dart';
import '/screens/signup_screen.dart';
import '/screens/slot_booking_screen.dart';
import '/screens/slot_history_screen.dart';
import '/screens/doctor_details_screen.dart';
import 'screens/doctor_by_category_screen.dart';
import '/screens/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignInState(),
        ),
        ChangeNotifierProvider(
          create: (_) => SigUpState(),
        ),
        ChangeNotifierProvider(
          create: (_) => SpecializationState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PopDoctorsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => DoctByCatState(),
        ),
        ChangeNotifierProvider(
          create: (_) => DoctByIdState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SignInScreen.routeName,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 176, 101, 189),
        ),
        routes: {
          SignInScreen.routeName: (context) => SignInScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          HomePage.routeName: (context) => HomePage(),
          DoctorByCatScreen.routeName: (context) => DoctorByCatScreen(),
          DoctorDetailsScreen.routeName: (context) => DoctorDetailsScreen(),
          SlotBookingScreen.routeName: (context) => SlotBookingScreen(),
          SlotHitoryScreen.routeName: (context) => SlotHitoryScreen(),
        },
      ),
    );
  }
}
