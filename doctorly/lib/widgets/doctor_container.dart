import 'package:flutter/material.dart';

class DoctorContainer extends StatelessWidget {
  final String doctorImage;
  final String doctorName;
  final String categoryName;
  final String qualification;
  final VoidCallback navigator;
  const DoctorContainer(
      {required this.doctorImage,
      required this.doctorName,
      required this.categoryName,
      required this.qualification,
      required this.navigator});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigator,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipOval(
                  child: Image.network(doctorImage),
                ),
                Flexible(
                  child: Text(
                    doctorName,
                    maxLines: 1,
                    style: TextStyle(height: 2),
                  ),
                ),
                Flexible(
                  child: Text(
                    categoryName,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    qualification,
                    maxLines: 1,
                    style: TextStyle(height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
