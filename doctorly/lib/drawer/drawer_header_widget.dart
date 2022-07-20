import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(
        margin: const EdgeInsets.all(10),
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://thumbs.dreamstime.com/z/stethoscope-medical-documents-doctor-table-purple-background-close-up-view-directly-above-medical-exam-health-care-170135332.jpg'),
        ),
      ),
    );
  }
}
