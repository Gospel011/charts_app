import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatelessWidget {
  const MyAnimatedContainer({
    super.key,
    this.color = Colors.grey,
    this.percentage = 300,
    this.borderRadius = 8,
  });

  final Color color;
  final double percentage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: color,
            ),
            height: 48,
            width: percentage,
          ),
        ],
      ),
    );
  }
}
