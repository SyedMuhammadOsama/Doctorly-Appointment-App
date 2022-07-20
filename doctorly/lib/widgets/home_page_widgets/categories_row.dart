import '/screens/doctor_by_category_screen.dart';

import '/widgets/home_page_widgets/categories_item.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) => Container(
            margin: const EdgeInsets.all(10),
            child: Categoriesitem(
                categoryImage:
                    'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
                categoryText: 'data',
                navigator: () {
                  Navigator.pushNamed(context, DoctorByCatScreen.routeName);
                }),
          )),
    );
  }
}
