import 'package:app/models/poll_items.dart';
import 'package:app/widgets/my_animated_container.dart';
import 'package:flutter/material.dart';


class MyPollItem extends StatelessWidget {
  const MyPollItem({super.key, required this.item, this.horizontalMargin = 16});

  final double horizontalMargin;

  final PollItems item;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width - horizontalMargin * 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: Stack(
        alignment: Alignment.center,
        children: [
          MyAnimatedContainer(
            percentage: 1.0 * maxWidth,
            color: Colors.grey.shade200,
          ),
          MyAnimatedContainer(
            percentage: item.percentage * maxWidth,
            color: item.voted ? Colors.blueGrey.shade400 : Colors.grey,
          ),
          Positioned(left: 16, child: Text(item.option)),
          Positioned(right: 16, child: Text("${(item.percentage * 100).toStringAsFixed(0)}%"))
        ],
      ),
    );
  }
}