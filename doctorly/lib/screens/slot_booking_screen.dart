import 'package:doctorly/widgets/slot_booking_widgets/patient_details_widget.dart';
import 'package:flutter/material.dart';

class SlotBookingScreen extends StatelessWidget {
  static const routeName = 'SlotBookingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Slot Bokking'),
      ),
      body: Column(
        children: [
          PatientDetailsWidget(),
        ],
      ),
    );
  }
}
