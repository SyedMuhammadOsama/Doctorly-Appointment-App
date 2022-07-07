import 'package:doctorly/models/state/doct_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Provider.of<DoctByIdState>(context)
                      .doctByIdStateData
                      ?.user
                      ?.name ??
                  '',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Provider.of<DoctByIdState>(context)
                        .doctByIdStateData
                        ?.specializations
                        ?.name ??
                    '',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
