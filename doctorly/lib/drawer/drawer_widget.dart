import 'package:doctorly/drawer/drawer_header_widget.dart';
import 'package:doctorly/drawer/drawer_list_tile.dart';
import 'package:doctorly/screens/Signin_screen.dart';
import 'package:doctorly/screens/home_page.dart';
import 'package:doctorly/screens/slot_history_screen.dart';
import 'package:doctorly/widgets/customized_text_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        children: [
          const DrawerHeaderWidget(),
          const SizedBox(
            height: 30,
          ),
          DrawerListTile(
              text: 'Home Page',
              icon: Icons.home_outlined,
              navigator: () {
                Navigator.popAndPushNamed(context, HomePage.routeName);
              }),
          DrawerListTile(
              text: 'History',
              icon: Icons.history,
              navigator: () {
                Navigator.popAndPushNamed(context, SlotHitoryScreen.routeName);
              }),
          DrawerListTile(
              text: 'Logout',
              icon: Icons.logout,
              navigator: () {
                Navigator.popAndPushNamed(context, SignInScreen.routeName);
              })
        ],
      ),
    );
  }
}
