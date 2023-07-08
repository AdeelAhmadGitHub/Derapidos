import 'dart:async';

import 'package:derapidos/View/Custom%20Widget/button.dart';
import 'package:derapidos/View/EnableLocation/enable_location_screen.dart';
import 'package:derapidos/View/Home/home_screen.dart';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/controllers/login_controller.dart';
import 'package:derapidos/controllers/sign_up_controller.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../Custom Widget/custom_text.dart';
import 'otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    boxShadow: const [
      BoxShadow(
        color: Color(0xffE5E3F1),
        spreadRadius: 0,
        blurRadius: 4,
        offset: Offset(0, 3),
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
  );

  var _isloading = false;
  var signUpController = Get.put(SignUpController());

  // String? _verificationCode;

  @override
  initState() {
    signUpController.otp.value = '';
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                        left: 96, right: 96, top: 50, bottom: 50)
                    .r,
                child: Image.asset(
                  "assets/images/logo1.png",
                  height: 43.h,
                  width: 211.w,
                ),
              ),
              SizedBox(
                width: 200.w,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: _start! < 10 ? "00 : 0$_start" : "00 : $_start",
                  // text: "00:42",
                  fontColor: const Color(0xff444444),
                  fontWeight: FontWeight.w500,
                  fontSize: 34.sp,
                ),
              ),
              SizedBox(height: 5.h),
              CustomText(
                textAlign: TextAlign.center,
                text: "Type the verification code \n we’ve sent you",
                fontColor: const Color(0xffC0C0C0),
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 50).r,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PinPut(
                    fieldsCount: 6,
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                      color: const Color(0xff191A1C),
                    ),
                    // obscureText: '*',
                    eachFieldWidth: 50.0,
                    eachFieldHeight: 55.0,
                    focusNode: _pinPutFocusNode,
                    controller: _pinController,
                    submittedFieldDecoration: pinPutDecoration,
                    selectedFieldDecoration: pinPutDecoration,
                    followingFieldDecoration: pinPutDecoration.copyWith(
                        //
                        ),
                    pinAnimationType: PinAnimationType.slide,
                    onChanged: (value) {},
                    onSubmit: (pin) async {},
                  ),
                ),

                ///
                //  OtpTextField(),
              ),
              // OtpTextField(),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      await verifyPhoneNumber(
                        signUpController.phone.value,
                        context,
                        () {},
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30).r,
                      child: CustomText(
                        text: "Send again?",
                        fontColor: const Color(0xff5D3EBD),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              _isloading
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55.h,
                        width: double.maxFinite.w,
                        child: MyCustomButton(
                          height: 55.h,
                          width: double.maxFinite,
                          onPressed: () async {
                            _isloading = true;
                            _redraw();
                            print('${signUpController.otp.value}');
                            var iD = signUpController.verificationId.value;
                            print('verification ID = $iD');
                            // await verifyOtp(iD);
                            // await checkAuth();

                            await signInwithPhoneNumber(
                                signUpController.verificationId.value,
                                _pinController
                                    .text, //    loginController.otp.value,
                                context);
                          },
                          buttonColor: const Color(0xff95006F),
                          text: "Verify",
                          textColor: const Color(0xffFFFFFF),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _redraw() {
    if (kDebugMode) setState(() {});
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      await checkAuth();
      // showSnackBar(context, "Verified Successfully");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future checkAuth() async {
    print('loginController phone ${signUpController.phone.value}');
    // UserProfile? response = await ApiServices.register();
    var res = await ApiServices.register(
      signUpController.name.value,
      signUpController.email.value,
      signUpController.password.value,
      signUpController.phone.value,
      signUpController.image != null ? signUpController.image!.path : null,
      // 'image',
    );
    _isloading = false;
    _redraw();
    if (res!) {
      Get.off(const LoginScreen());
    } else {
      showSnackBar(context, 'Some Error Occur');
    }
    // print('status  ss ${response!.status}');
    // var res = await ApiServices.register(
    //     name, email, password, phone, 'image');
    // _isloading = false;
    // _redraw();
    // if (res!) {
    //   Get.to(const OtpScreen());
    // }
    // if (response != null) {
    //   print('status  ss ${response.status}');
    //   UserPreferences sp = await SharedPreferences.getInstance();
    //   sp.setBool('isLogin', true);
    //   sp.setString('token', response.accessToken!);
    //   if (response.status!) {
    //     Get.offAll(const NavigationBarScreen());
    //   } else {
    //     Get.to(const SignUpScreen());
    //   }
    // } else {
    //   print('LoginResponse model is null');
    //   Get.to(const SignUpScreen());
    // }
  }

  Timer? _timer;
  int? _start = 60;
  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              // if (_start! > 60) {
              //   timer.cancel();
              // } else {
              //   _start = _start! + 1;
              // }
              if (_start! < 1) {
                timer.cancel();
              } else {
                _start = _start! - 01;
              }
            }));
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  ///

  /// //////////////
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  Future verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      // showSnackBar(context, "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      // Get.to(const OtpScreen());
      signUpController.verificationId.value = verificationID;
      startTimer();
      Get.to(const OtpScreen());
      // setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out");
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  ///

}
