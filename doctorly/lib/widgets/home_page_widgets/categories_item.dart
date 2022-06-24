import 'package:flutter/material.dart';

class Categoriesitem extends StatelessWidget {
  final String categoryImage;
  final String categoryText;
  Categoriesitem(this.categoryImage, this.categoryText);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Color.fromARGB(255, 176, 101, 189))),
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 80,
          height: 85,
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
                  style: const TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
