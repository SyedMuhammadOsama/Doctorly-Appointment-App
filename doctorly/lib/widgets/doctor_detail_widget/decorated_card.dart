import 'package:doctorly/models/parsed/doct_by_id_api_parsed.dart';
import 'package:doctorly/models/state/doct_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecoratedCard extends StatelessWidget {
  final String textQuantity;
  final String text;
  IconData icon;
  DecoratedCard(
      {required this.textQuantity, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
