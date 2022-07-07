import 'package:flutter/material.dart';

class Categoriesitem extends StatelessWidget {
  final String categoryImage;
  final String categoryText;
  final VoidCallback navigator;

  Categoriesitem(
      {required this.categoryImage,
      required this.categoryText,
      required this.navigator});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigator,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
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
              Flexible(
                child: Text(
                  categoryText,
                  maxLines: 1,
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
