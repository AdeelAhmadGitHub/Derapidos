import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/Profile/profile.dart';
import 'package:derapidos/component/const.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../consts/app_consts.dart';
import 'Custom Widget/custom_text.dart';

class DeleteAccountScreen extends StatefulWidget {
  static const String id = "DeleteAccountScreen";
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String dropdownValue = 'Something was broken';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Image.asset(
          "assets/images/logo1.png",
          height: 43.h,
          width: 150.w,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors().mainColor2,
        toolbarHeight: 40.h,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        CustomText(
                          text: "Delete Account",
                          fontSize: 25.sp,
                          //fontColor: kMainColor,
                        ),
                        SizedBox(height: 20.h),
                        CustomCard(
                          height: 45.h,
                          width: 335.w,
                          cardChild: Center(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24.sp,
                              elevation: 16,
                              style: TextStyle(color: Colors.black, fontSize: 18.sp),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Something was broken',
                                "I'm not getting any invites",
                                'I have a privacy  concern',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomCard(
                          height: 250.h,
                          width: 335.w,
                          cardChild: TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 15.w, bottom: 11.h, top: 11.h, right: 15.w),
                                hintText: "Why you delete account"),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: Container(
                            height: 35.h,
                            width: 335.w,
                            decoration:
                                BoxDecoration(color: kMainColor, borderRadius: BorderRadius.circular(40.r)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: kMainColor),
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 150.h),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 50.h),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(40.r)),
                                            child: Column(
                                              children: [
                                                CustomText(
                                                  text: "Are you sure",
                                                  fontSize: 26.sp,
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 60.h),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                      height: 35.h,
                                                      width: 120.w,
                                                      decoration: BoxDecoration(
                                                          color: kMainColor,
                                                          borderRadius: BorderRadius.circular(15.r)),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: kMainColor,
                                                        ),
                                                        onPressed: () async {
                                                          UserPreferences.setLoginCheck(false);

                                                          Navigator.of(context).pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                builder: (context) => LoginScreen(),
                                                              ),
                                                              (Route<dynamic> route) => false);
                                                        },
                                                        child: CustomText(
                                                          text: "Yes",
                                                          fontSize: 18.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 35.h,
                                                      width: 120.w,
                                                      decoration: BoxDecoration(
                                                        color: kMainColor,
                                                        borderRadius: BorderRadius.circular(15.r),
                                                      ),
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: kMainColor,
                                                          ),
                                                          onPressed: () async {
                                                            Navigator.of(context).pushAndRemoveUntil(
                                                                MaterialPageRoute(
                                                                  builder: (context) => Profile(),
                                                                ),
                                                                (Route<dynamic> route) => false);
                                                          },
                                                          child: CustomText(
                                                            text: "No",
                                                            fontSize: 18.sp,
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                              child: CustomText(
                                text: "Submit",
                                fontColor: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
