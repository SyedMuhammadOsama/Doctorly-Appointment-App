// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DecoratedCard extends StatelessWidget {
  final String textQuantity;
  final String text;
  IconData icon;
  DecoratedCard(
      {Key? key,
      required this.textQuantity,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 100,
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(233, 170, 244, 1),
              ),
              padding: const EdgeInsets.all(5),
              height: 55,
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7),
              child: Text(
                textQuantity,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.merge(
                  const TextStyle(color: Colors.grey, wordSpacing: 1.5)),
            )
          ],
        ),
      ),
    );
  }
}
