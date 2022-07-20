import 'package:flutter/material.dart';

class HeadlineTextWidget extends StatelessWidget {
  final String text;
  final double top;
  final double bottom;
  final double left;
  final double right;
  const HeadlineTextWidget(this.text,
      {Key? key, this.top = 0, this.bottom = 0, this.left = 10, this.right = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
