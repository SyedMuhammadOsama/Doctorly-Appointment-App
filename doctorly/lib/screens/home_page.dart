import '/widgets/home_page_widgets/categories_item.dart';
import '/widgets/home_page_widgets/categories_row.dart';
import '/widgets/home_page_widgets/display_image_container.dart';
import '/widgets/grid_view_widget.dart';
import '../widgets/textfieldwidget.dart';

import '/widgets/doctor_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 176, 101, 189),
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DisplayImageContainer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Categories',
              style: Theme.of(context).textTheme.headline6?.merge(
                    TextStyle(
                      color: Color.fromARGB(255, 176, 101, 189),
                    ),
                  ),
            ),
          ),
          Expanded(child: CategoriesRow()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Popular Doctors',
              style: Theme.of(context).textTheme.headline6?.merge(
                    TextStyle(
                      color: Color.fromARGB(255, 176, 101, 189),
                    ),
                  ),
            ),
          ),
          Expanded(
            flex: 2,
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
