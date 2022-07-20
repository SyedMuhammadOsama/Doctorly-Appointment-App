import '/widgets/slot_booking_widgets/patient_details_widget.dart';
import '/widgets/slot_booking_widgets/slot_details_widget.dart';
import 'package:flutter/material.dart';

class SlotBookingScreen extends StatelessWidget {
  static const routeName = 'SlotBookingScreen';

  const SlotBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Slot Bokking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SlotDetailsWidget(),
            PatientDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
