import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? cardColor;
  final double? radius;
  final Widget? cardChild;
  final List<BoxShadow>? cardShadow;

  const Card1(
      {super.key,
      @required this.height,
      @required this.width,
      this.cardColor,
      this.radius,
      this.cardChild,
      this.cardShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(radius!),
          boxShadow: cardShadow),
      child: cardChild,
    );
  }
}
