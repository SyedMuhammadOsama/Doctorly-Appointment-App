import '../widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

import '../widgets/doctor_container.dart';
import '../widgets/grid_view_widget.dart';

class DoctorByCatScreen extends StatelessWidget {
  const DoctorByCatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors By Category'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWidget(),
          Expanded(
            flex: 2,
            child: GridViewWidget(DoctorContainer(
                'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                'Dr.Alpha',
                'General Physician',
                'MBBS')),
          )
        ],
      ),
    );
  }
}
