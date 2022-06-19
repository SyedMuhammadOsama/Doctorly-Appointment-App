import 'package:doctorly_appointment_app/widgets/categories_item.dart';
import 'package:doctorly_appointment_app/widgets/categories_row.dart';
import 'package:doctorly_appointment_app/widgets/grid_view_widget.dart';

import '/widgets/doctor_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(child: CategoriesRow()),
          Expanded(
            flex: 5,
            child: GridViewWidget(DoctorContainer(
                'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                'Dr.Alpha',
                'General Physician',
                'MBBS')),
          )
        ],
      ),
      // const Categoriesitem()
      // const GridViewWidget(DoctorContainer()),
    );
  }
}
