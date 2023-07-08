import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;

  const CustomText(
      {super.key,
      @required this.text,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
      this.textAlign,
      this.textOverflow,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: TextStyle(
        // overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "DMSans",
        color: fontColor,
        letterSpacing: letterSpacing,
      ),
      overflow: textOverflow,
    );
  }
}

class CustomText3 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;

  const CustomText3(
      {super.key,
      @required this.text,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
      this.textAlign,
      this.textOverflow,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: TextStyle(
        // overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "SFUIText",
        color: fontColor,
        letterSpacing: letterSpacing,
      ),
      overflow: textOverflow,
    );
  }
}

class CustomText4 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;

  const CustomText4(
      {super.key,
      @required this.text,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
      this.textAlign,
      this.textOverflow,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: TextStyle(
        // overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "SFUIText",
        color: fontColor,
        letterSpacing: letterSpacing,
      ),
      overflow: textOverflow,
    );
  }
}

class CustomText2 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? letterSpacing;

  const CustomText2(
      {super.key,
      @required this.text,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
      this.textAlign,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: TextStyle(
        // overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "DavidLibre",
        color: fontColor,
        letterSpacing: letterSpacing,
      ),
      overflow: TextOverflow.clip,
    );
  }
}
