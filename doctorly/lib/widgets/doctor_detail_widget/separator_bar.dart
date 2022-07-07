import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class SeparatorBar extends StatelessWidget {
  const SeparatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: DottedLine(
          direction: Axis.horizontal,
          lineLength: 50,
          lineThickness: 1,
          dashLength: 4.0,
          dashColor: Theme.of(context).primaryColor,
          dashRadius: 0.0,
          dashGapLength: 4.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
      ),
    );
  }
}
