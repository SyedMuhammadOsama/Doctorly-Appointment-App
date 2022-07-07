import 'package:doctorly/models/state/doct_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
      ),
      child: Text(
        Provider.of<DoctByIdState>(context).doctByIdStateData?.description ??
            '',
        style: TextStyle(fontSize: 17, height: 1.5, wordSpacing: 1.5),
      ),
    );
  }
}
