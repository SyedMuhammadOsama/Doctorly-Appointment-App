import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final Widget gridViewItem;
  const GridViewWidget(this.gridViewItem);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      itemCount: 10,
      itemBuilder: ((context, index) => gridViewItem),
    );
  }
}
