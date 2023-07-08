import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final String? hintText;
  final TextAlign? hintTextAlign;
  final TextEditingController? textEditingController;
  final FormFieldValidator? velidator;
  final bool? readOption;
  final IconData? prefixIcon;

  const CustomTextField({
    this.height,
    this.width,
    @required this.hintText,
    this.hintTextAlign,
    this.textEditingController,
    @required this.prefixIcon,
    this.velidator,
    this.readOption = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10.0,
            color: Color(0xffE5E5E5),
          ),
        ],
      ),
      child: TextField(
        cursorColor: const Color(0xffC0C0C0),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(13.0, 11.0, 13.0, 13.0).r,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(82.0.r),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(82.0.r)),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff9C0C0C0),
            fontFamily: 'DMSans',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
