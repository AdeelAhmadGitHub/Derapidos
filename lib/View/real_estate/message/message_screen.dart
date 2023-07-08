import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../consts/app_consts.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: CustomText(
          text: "Messages",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          fontColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10..w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
            10,
            (index) => Column(
              children: [
                SizedBox(height: 7..h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30..r,
                      backgroundColor: Color(0xffA8C1C3),
                      child: CircleAvatar(
                        radius: 27..r,
                        backgroundImage: AssetImage("assets/images/44.png"),
                      ),
                    ),
                    SizedBox(width: 9..w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Jhon",
                          fontSize: 15.sp,
                          fontColor: Color(0xff2F3571),
                        ),
                        CustomText(
                          text: "ok , see you than.",
                          fontSize: 14.sp,
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        CustomText(
                          text: "10 min",
                          fontSize: 15.sp,
                          fontColor: Color(0xffA8C1C3),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Color(0xff1D6CEF), shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CustomText(
                              text: "10",
                              fontSize: 14.sp,
                              fontColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 7..h),
                Divider(
                  color: Color(0xffC4C4C4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
