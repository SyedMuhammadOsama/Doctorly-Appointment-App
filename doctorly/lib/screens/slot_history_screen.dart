import '/widgets/slot_history_widgets/history_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SlotHitoryScreen extends StatelessWidget {
  static const routeName = 'SlotHitoryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: HistoryContainer(
              ptName: 'Patient Name',
              drName: 'Dr. Alpha',
              date: DateFormat.yMMMd().format(DateTime.now()),
              time: '9.00 AM',
            ),
          ),
        ),
      ),
    );
  }
}
