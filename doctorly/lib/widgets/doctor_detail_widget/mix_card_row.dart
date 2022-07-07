import 'package:provider/provider.dart';

import '../../models/state/doct_by_id_state.dart';
import 'decorated_card.dart';
import 'package:flutter/material.dart';

class MixCardRow extends StatelessWidget {
  const MixCardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DecoratedCard(
            textQuantity: Provider.of<DoctByIdState>(context)
                    .doctByIdStateData
                    ?.noOfPatients
                    ?.toString() ??
                '',
            text: 'Patients',
            icon: Icons.people_outline_outlined,
          ),
          DecoratedCard(
              textQuantity:
                  '${Provider.of<DoctByIdState>(context).doctByIdStateData?.experience?.toString() ?? ''} Yrs',
              text: 'Experience',
              icon: Icons.star),
          DecoratedCard(
            textQuantity: Provider.of<DoctByIdState>(context)
                    .doctByIdStateData
                    ?.rating
                    .toString() ??
                '',
            text: 'rating',
            icon: Icons.star_border_outlined,
          ),
        ],
      ),
    );
  }
}
