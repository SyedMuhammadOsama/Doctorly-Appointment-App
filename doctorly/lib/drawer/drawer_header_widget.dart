import 'package:flutter/material.dart';

import '../widgets/customized_text_widget.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.bottomLeft,
        child: CustomizedTextWidget(
          'User Name',
          fontSize: 23,
          fontWeight: FontWeight.bold,
          alignment: TextAlign.start,
        ),
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
