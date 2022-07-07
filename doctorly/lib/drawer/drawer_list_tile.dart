import 'package:doctorly/widgets/customized_text_widget.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback navigator;
  DrawerListTile(
      {required this.text, required this.icon, required this.navigator});
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).primaryColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          onTap: navigator,
          title: CustomizedTextWidget(text, fontSize: 20),
          leading: Icon(
            icon,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
