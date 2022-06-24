import 'package:flutter/material.dart';

class DisplayImageContainer extends StatelessWidget {
  const DisplayImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      height: 200,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://images.unsplash.com/photo-1624969862293-b749659ccc4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXBwb2ludG1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
