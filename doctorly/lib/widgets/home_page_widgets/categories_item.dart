import 'package:flutter/material.dart';

class Categoriesitem extends StatelessWidget {
  final String categoryImage;
  final String categoryText;
  final VoidCallback navigator;

  const Categoriesitem(
      {Key? key,
      required this.categoryImage,
      required this.categoryText,
      required this.navigator})
      : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  categoryImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                child: Center(
                  child: Text(
                    categoryText,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
