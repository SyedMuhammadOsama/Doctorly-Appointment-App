import 'package:flutter/material.dart';

class DoctorContainer extends StatelessWidget {
  final String doctorImage;
  final String doctorName;
  final String categoryName;
  final String qualification;
  final VoidCallback navigator;
  const DoctorContainer(
      {Key? key,
      required this.doctorImage,
      required this.doctorName,
      required this.categoryName,
      required this.qualification,
      required this.navigator})
      : super(key: key);

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
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SafeArea(
              child: Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      doctorImage,
                      width: 120,
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        doctorName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.merge(
                            const TextStyle(fontWeight: FontWeight.w500)),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        categoryName,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.merge(const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        qualification,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
