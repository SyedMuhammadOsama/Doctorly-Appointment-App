// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HistoryContainer extends StatelessWidget {
  String? ptName;
  String? drName;
  String? date;
  String? time;
  HistoryContainer(
      {Key? key,
      required this.ptName,
      required this.drName,
      required this.date,
      required this.time})
      : super(key: key);

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
          title: Text(ptName ?? '',
              style: const TextStyle(
                fontSize: 17,
                height: 1.5,
              )),
          isThreeLine: true,
          subtitle: Text(
            '$date \n$time',
            style: const TextStyle(height: 1.5),
          ),
          leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.history,
              color: Theme.of(context).primaryColor,
            ),
          ),
          trailing:
              Text(drName ?? '', style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}
