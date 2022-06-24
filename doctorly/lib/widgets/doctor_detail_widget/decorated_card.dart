import 'package:flutter/material.dart';

class DecoratedCard extends StatelessWidget {
  const DecoratedCard({Key? key}) : super(key: key);

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
                color: Color.fromARGB(255, 142, 204, 255),
              ),
              padding: const EdgeInsets.all(5),
              height: 55,
              child: Icon(
                Icons.star_border_outlined,
                color: Color.fromARGB(255, 5, 108, 192),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7),
              child: Text(
                '1000+',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Text(
              'Experiance',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
