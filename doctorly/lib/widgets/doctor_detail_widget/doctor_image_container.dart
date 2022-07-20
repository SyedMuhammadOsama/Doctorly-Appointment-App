import '/models/state/doct_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorImageContainer extends StatelessWidget {
  const DoctorImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 170,
      child: Center(
        child: ClipOval(
          child: Image.network(
            Provider.of<DoctByIdState>(context).doctByIdStateData?.image ??
                'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
            width: 190,
          ),
        ),
      ),
    );
  }
}
