import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback navigator;
  const DrawerListTile(
      {Key? key,
      required this.text,
      required this.icon,
      required this.navigator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).primaryColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          onTap: navigator,
          title: Text(text, style: Theme.of(context).textTheme.bodyLarge),
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
