import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final Widget gridViewItem;
  final ScrollPhysics? scrolling;
  const GridViewWidget({required this.gridViewItem, this.scrolling});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: scrolling,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 4 / 5,
      ),
      itemCount: 10,
      itemBuilder: ((context, index) => gridViewItem),
    );
  }
}
