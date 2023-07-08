import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70.h,
          width: 66.w,
          decoration: BoxDecoration(
            color: const Color(0xff5D3EBD),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextField(
            autofocus: true,
            style: TextStyle(
              fontSize: 34.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "DMSans",
              color: Colors.white,
            ),
            keyboardType: TextInputType.phone,
            cursorColor: Theme.of(context).primaryColor,
            showCursor: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              isDense: true,
              border: InputBorder.none, counterText: "",
              hoverColor: Colors.white,
              // border: UnderlineInputBorder(),
              hintStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'DMSans',
                fontSize: 34.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          height: 70.h,
          width: 66.w,
          decoration: BoxDecoration(
            color: const Color(0xff5D3EBD),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextField(
            autofocus: true,
            style: TextStyle(
              fontSize: 34.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "DMSans",
              color: Colors.white,
            ),
            keyboardType: TextInputType.phone,
            cursorColor: Theme.of(context).primaryColor,
            showCursor: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              isDense: true,
              border: InputBorder.none, counterText: "",
              hoverColor: Colors.white,
              // border: UnderlineInputBorder(),
              hintStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'DMSans',
                fontSize: 34.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          height: 70.h,
          width: 66.w,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0xffE5E5E5),
                spreadRadius: 0,
                blurRadius: 5,
                //offset: Offset(0, 3),
                // changes position of shadow
              ),
            ],
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextField(
            autofocus: true,
            style: TextStyle(
              fontSize: 34.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "DMSans",
              color: const Color(0xff5D3EBD).withOpacity(0.4),
            ),
            keyboardType: TextInputType.phone,
            cursorColor: Theme.of(context).primaryColor,
            showCursor: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              isDense: true,
              border: InputBorder.none, counterText: "",
              hoverColor: Colors.white,
              // border: UnderlineInputBorder(),
              hintStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'DMSans',
                fontSize: 34.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          height: 70.h,
          width: 66.w,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0xffE5E5E5),
                spreadRadius: 0,
                blurRadius: 5,
                //offset: Offset(0, 3),
                // changes position of shadow
              ),
            ],
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextField(
            autofocus: true,
            style: TextStyle(
              fontSize: 34.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "DMSans",
              color: const Color(0xffE8E6EA),
            ),
            keyboardType: TextInputType.phone,
            cursorColor: Theme.of(context).primaryColor,
            showCursor: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              isDense: true,
              border: InputBorder.none, counterText: "",
              hoverColor: Colors.white,
              // border: UnderlineInputBorder(),
              hintStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'DMSans',
                fontSize: 34.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }
}
