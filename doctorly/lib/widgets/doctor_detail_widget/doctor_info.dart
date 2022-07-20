import '/models/state/doct_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Provider.of<DoctByIdState>(context).doctByIdStateData?.user?.name ??
                '',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
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
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
