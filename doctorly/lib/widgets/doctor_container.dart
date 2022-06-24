import 'package:flutter/material.dart';

class DoctorContainer extends StatelessWidget {
  final String doctorImage;
  final String doctorName;
  final String categoryName;
  final String qualification;

  const DoctorContainer(
      this.doctorImage, this.doctorName, this.categoryName, this.qualification);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(255, 176, 101, 189)),
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
                FittedBox(
                  child: Text(
                    doctorName,
                    style: TextStyle(height: 2),
                  ),
                ),
                FittedBox(
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    qualification,
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
