import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../SignUp/sign_up_screen.dart';
import '../home_main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
  bool isSelected = false;
  var _isloading = false;
  bool _isObscure = true;

  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,

      child: Scaffold(
        backgroundColor: Color(0xF8F8F8F4),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Image.asset(
                  "assets/images/logo1.png",
                  height: 43.h,
                  width: 211.w,
                ),
                SizedBox(height: 50.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Hi, Welcome Back!",
                      textAlign: TextAlign.start,
                      fontColor: const Color(0xff444444),
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: "Login in to your account",
                      fontColor: const Color(0xffC0C0C0),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      height: 55.h,
                      width: double.maxFinite.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10.0.r),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffE5E5E5),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: TextField(
                          cursorColor: const Color(0xffC0C0C0),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              FontAwesomeIcons.envelope,
                              size: 17,
                              color: Color(0xffC0C0C0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            hintText: "Your Email",
                            hintStyle: TextStyle(
                              color: const Color(0xff9C0C0C0),
                              fontFamily: 'DMSans',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 55.h,
                      width: double.maxFinite.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10.0.r),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffE5E5E5),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: _isObscure,
                          cursorColor: const Color(0xffC0C0C0),
                          decoration: InputDecoration(
                            prefixIcon: const ImageIcon(
                              AssetImage("assets/images/lock.png"),
                              color: Color(0xffC0C0C0),
                              size: 18,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.r,
                                color: const Color(0xff9C0C0C0),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: const Color(0xff9C0C0C0),
                              fontFamily: 'DMSans',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    _isloading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(),
                            ],
                          )
                        : Container(
                            height: 54.h,
                            width: double.maxFinite.w,
                            child: MyCustomButton(
                              onPressed: () async {
                                _isloading = true;
                                _redraw();
                                var res =
                                    await ApiServices.login(email, password);
                                _isloading = false;
                                _redraw();
                                if (res!) {
                                  Get.off(MainScreen());
                                }
                              },
                              height: 55.h,
                              width: double.maxFinite.w,
                              buttonColor: const Color(0xff95006F),
                              text: "Login",
                              textColor: const Color(0xffFFFFFF),
                              fontSize: 14.sp,
                            ),
                          ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Don’t have an account?",
                          fontColor: const Color(0xffC0C0C0),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(const SignUpScreen());
                          },
                          child: CustomText(
                            text: "Sign Up",
                            fontColor: const Color(0xff95006F),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // await UserPreferences.setUserData("");
                            // UserPreferences.setLoginCheck(false);
                            UserPreferences.setLoginCheck(false);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                                (Route<dynamic> route) => false);
                          },
                          child: CustomText(
                            text: "Skip",
                            fontColor: const Color(0xff95006F),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _redraw() {
    if (kDebugMode) setState(() {});
  }
}
