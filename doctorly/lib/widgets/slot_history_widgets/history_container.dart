import 'package:doctorly/widgets/customized_text_widget.dart';
import 'package:flutter/material.dart';

class HistoryContainer extends StatelessWidget {
  String? ptName;
  String? drName;
  String? date;
  String? time;
  HistoryContainer(
      {required this.ptName,
      required this.drName,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Theme.of(context).primaryColor)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          minVerticalPadding: 10,
          title: CustomizedTextWidget(
            ptName!,
            fontSize: 17,
            height: 1.5,
          ),
          isThreeLine: true,
          subtitle: Text(
            '$date \n $time',
            style: const TextStyle(height: 1.5),
          ),
          leading: Container(
            height: double.infinity,
            child: Icon(
              Icons.history,
              color: Theme.of(context).primaryColor,
            ),
          ),
          trailing: CustomizedTextWidget(
            drName!,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
