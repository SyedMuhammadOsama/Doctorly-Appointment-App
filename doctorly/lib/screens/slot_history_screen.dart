import '/models/state/patient_history_state.dart';
import 'package:provider/provider.dart';

import '../widgets/slot_history_widgets/history_container.dart';

import 'package:flutter/material.dart';

class SlotHitoryScreen extends StatelessWidget {
  static const routeName = 'SlotHitoryScreen';

  const SlotHitoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: Provider.of<PatientHistoryState>(context)
              .patientHistoryStateData
              ?.data
              ?.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: HistoryContainer(
              ptName: Provider.of<PatientHistoryState>(context)
                  .patientHistoryStateData
                  ?.data?[index]
                  .patient
                  ?.name,
              drName: Provider.of<PatientHistoryState>(context)
                  .patientHistoryStateData
                  ?.data?[index]
                  .doctor
                  ?.user
                  ?.name,
              date: Provider.of<PatientHistoryState>(context)
                  .patientHistoryStateData
                  ?.data?[index]
                  .timings
                  ?.occurringDate
                  ?.split('-')
                  .reversed
                  .join('-'),
              time:
                  '${Provider.of<PatientHistoryState>(context).patientHistoryStateData?.data?[index].timings?.slot?.start}-${Provider.of<PatientHistoryState>(context).patientHistoryStateData?.data?[index].timings?.slot?.end}',
            ),
          ),
        ),
      ),
    );
  }
}
