// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SlotContainer extends StatelessWidget {
  final String day;
  final String date;
  final int index;
  int selectedIndex;
  VoidCallback onTap;
  SlotContainer(
      {Key? key,
      required this.day,
      required this.date,
      required this.index,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 120,
          width: 100,
          child: Card(
            elevation: 3,
            color: selectedIndex == index
                ? Theme.of(context).primaryColor
                : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  child: Text(
                    day.substring(0, 3).toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Text(date.split('-').reversed.join('-'),
                    style: Theme.of(context).textTheme.bodyMedium?.merge(
                          TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.blueGrey),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
