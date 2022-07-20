import '/models/state/slots_state.dart';

import '/widgets/headline_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'slot_container.dart';

class SlotDetailsWidget extends StatefulWidget {
  const SlotDetailsWidget({Key? key}) : super(key: key);

  @override
  State<SlotDetailsWidget> createState() => _SlotDetailsWidgetState();
}

class _SlotDetailsWidgetState extends State<SlotDetailsWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadlineTextWidget(
              'Select your slot',
              top: 20,
              bottom: 5,
              left: 20,
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Provider.of<SlotsState>(context)
                    .slotsStateData
                    ?.data
                    ?.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SlotContainer(
                      day: Provider.of<SlotsState>(context)
                              .slotsStateData
                              ?.data?[index]
                              .slot
                              ?.day ??
                          '',
                      date: Provider.of<SlotsState>(context)
                              .slotsStateData
                              ?.data?[index]
                              .occurringDate ??
                          '',
                      index: index,
                      selectedIndex: selectedIndex,
                      onTap: () {
                        selectedIndex != index
                            ? Provider.of<SlotsState>(context, listen: false)
                                .setSlotId(Provider.of<SlotsState>(context,
                                        listen: false)
                                    .slotsStateData
                                    ?.data?[index]
                                    .slot
                                    ?.id)
                            : Provider.of<SlotsState>(context, listen: false)
                                .setSlotId(-1);
                        setState(
                          () {
                            selectedIndex != index
                                ? selectedIndex = index
                                : selectedIndex = -1;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                  selectedIndex != -1
                      ? 'Timings: ${Provider.of<SlotsState>(context).slotsStateData?.data?[selectedIndex].slot?.start} - ${Provider.of<SlotsState>(context).slotsStateData?.data?[selectedIndex].slot?.end}'
                      : 'Timings: Not selected',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
