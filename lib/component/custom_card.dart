import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final List<BoxShadow>? boxShadow;

  final double? height;
  final double? width;
  final Widget cardChild;
  final Color? cardColor;
  final BoxBorder? border;
  final BorderRadius? borderRadius;

  const CustomCard(
      {Key? key,
      this.boxShadow,
      this.height,
      this.width,
      required this.cardChild,
      this.cardColor,
      this.border,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: cardColor,
        boxShadow: boxShadow,
        border: border,
        borderRadius: borderRadius,
      ),
      child: cardChild,
    );
  }
}
