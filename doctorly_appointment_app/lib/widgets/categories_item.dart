import 'package:flutter/material.dart';

class Categoriesitem extends StatelessWidget {
  final String categoryImage;
  final String categoryText;
  Categoriesitem(this.categoryImage, this.categoryText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 80,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Image.network(
              categoryImage,
              fit: BoxFit.cover,
            ),
          ),
          FittedBox(
            child: Text(
              categoryText,
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
