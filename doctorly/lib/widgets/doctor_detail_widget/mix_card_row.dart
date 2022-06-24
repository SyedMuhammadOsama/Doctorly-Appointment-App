import 'decorated_card.dart';
import 'package:flutter/material.dart';

class MixCardRow extends StatelessWidget {
  const MixCardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DecoratedCard(),
          DecoratedCard(),
          DecoratedCard(),
        ],
      ),
    );
  }
}
