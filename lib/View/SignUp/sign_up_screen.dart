import 'dart:io';

import 'package:derapidos/View/EnableLocation/enable_location_screen.dart';
import 'package:derapidos/controllers/sign_up_controller.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/theme.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';
import '../Login/login_screen.dart';
import '../Otp/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        )) ??
        false;
  }

  bool isSelected = false;
  var _isloading = false;
  bool? _isObscureP = true;
  bool? _isObscureCP = true;
  //
  String? name = '', email = '', phone = '', password = '', cPassword = '', phoneWC = '';
  var signUpController = Get.put(SignUpController());
  String? imageLink;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool? _loading = false;

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
      signUpController.image = _imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xF8F8F8F4),
        body: SafeArea(

          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Image.asset(
                    "assets/images/logo1.png",
                    height: 100.h,
                    width: 300.w,
                  ),
                  SizedBox(height: 50.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Create account",
                          textAlign: TextAlign.start,
                          fontColor: const Color(0xff444444),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 30.h),

                        ///
                        imageProfile(),
                        SizedBox(height: 30.h),

                        ///
                        Container(
                          height: 55.h,
                          width: double.maxFinite.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(47.0.r),
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
                          child: TextField(
                            cursorColor: const Color(0xffC0C0C0),
                            decoration: InputDecoration(
                              prefixIcon: const ImageIcon(
                                AssetImage(
                                  "assets/images/User Icon.png",
                                ),
                                color: Color(0xffC0C0C0),
                                size: 17,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              // contentPadding:
                              //     EdgeInsets.fromLTRB(13.0, 11.0, 13.0, 13.0).r,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0.r),
                              ),
                              hintText: "Full Name",
                              hintStyle: TextStyle(
                                color: const Color(0xff9C0C0C0),
                                fontFamily: "DMSans",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (value) {
                              name = value;
                              signUpController.name.value = value;
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 55.h,
                          width: double.maxFinite.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(47.0.r),
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
                                borderRadius: BorderRadius.circular(47.0.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(470.r),
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
                              signUpController.email.value = value;
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // Phone Number
                        /*
                        Container(
                          height: 55.h,
                          width: double.maxFinite.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(47.0.r),
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
                          child: TextField(
                            cursorColor: const Color(0xffC0C0C0),
                            decoration: InputDecoration(
                              prefixIcon: const ImageIcon(
                                AssetImage(
                                  "assets/images/phoneIcon.png",
                                ),
                                color: Color(0xffC0C0C0),
                                size: 18,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0),
                              ),
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(
                                color: const Color(0xff9C0C0C0),
                                fontFamily: 'DMSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (value) {
                              phone = value;
                              signUpController.phone.value = value;
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
*/
                        /// Phone Number Field
                        Container(
                          height: 55.h,
                          width: double.maxFinite.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(47.0.r),
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
                          child: Container(
                            padding: const EdgeInsets.only(left: 12, right: 20),
                            child: IntlPhoneField(
                              dropdownIconPosition: IconPosition.trailing,
                              decoration: InputDecoration(
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                  color: const Color(0xffC0C0C0),
                                  fontFamily: 'DMSans',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                prefixIcon: const ImageIcon(
                                  AssetImage(
                                    "assets/images/phoneIcon.png",
                                  ),
                                  color: Color(0xffC0C0C0),
                                  size: 18,
                                ),
                                labelStyle: TextStyle(
                                  color: const Color(0xff9C0C0C0),
                                  fontFamily: 'DMSans',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                //
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(47.0.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(470.r),
                                ),
                              ),
                              //Code Style
                              dropdownTextStyle: TextStyle(
                                color: const Color(0xffC0C0C0),
                                fontFamily: 'DMSans',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w800,
                              ),
                              // dropdownIcon: const Icon(
                              //   Icons.keyboard_arrow_down,
                              //   color: Color(0xff7F8492),
                              // ),
                              // flagsButtonPadding: const EdgeInsets.only(left: 6),
                              showCountryFlag: false, disableLengthCheck: true,
                              cursorColor: const Color(0xff959EA7),
                              initialCountryCode: 'US', // 'US',
                              onChanged: (phone) {
                                signUpController.phone.value = phone.countryCode + phone.number;
                                phoneWC = phone.number;
                                print('phone ${signUpController.phone.value}');
                              },
                            ),
                          ),
                        ),

                        ///
                        SizedBox(height: 20.h),
                        Container(
                          height: 55.h,
                          width: double.maxFinite.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(47.0.r),
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
                          child: TextField(
                            obscureText: _isObscureP!,
                            cursorColor: const Color(0xffC0C0C0),
                            decoration: InputDecoration(
                              prefixIcon: const ImageIcon(
                                AssetImage(
                                  "assets/images/lock.png",
                                ),
                                color: Color(0xffC0C0C0),
                                size: 18,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscureP! ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                  size: 15,
                                  color: const Color(0xffC0C0C0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscureP = !_isObscureP!;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0.r),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: const Color(0xffC0C0C0),
                                fontFamily: 'DMSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (value) {
                              password = value;
                              signUpController.password.value = value;
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 55.h,
                          width: double.maxFinite.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(47.0.r),
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
                          child: TextField(
                            obscureText: _isObscureCP!,
                            cursorColor: const Color(0xffC0C0C0),
                            decoration: InputDecoration(
                              prefixIcon: const ImageIcon(
                                AssetImage(
                                  "assets/images/lock.png",
                                ),
                                color: Color(0xffC0C0C0),
                                size: 18,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscureCP! ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                  size: 15,
                                  color: const Color(0xffC0C0C0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscureCP = !_isObscureCP!;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0).r,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(47.0.r),
                              ),
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                color: const Color(0xffc0c0c0),
                                fontFamily: 'DMSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (value) {
                              cPassword = value;
                              signUpController.password.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: const Color(0xff95006F),
                          activeColor: Colors.white,
                          side: const BorderSide(
                            color: Color(0xffC0C0C0),
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          value: isSelected,
                          onChanged: (newValue) {
                            isSelected = newValue!;
                            _redraw();
                          },
                        ),
                        CustomText(
                          text: "Agree terms & Conditions",
                          fontColor: const Color(0xff444444),
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
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
                                // Get.to(const OtpScreen());
                                // return;
                                if (signUpController.name.value.isEmpty) {
                                  showSnackBar(context, 'Name is Empty');
                                  return;
                                }
                                if (signUpController.email.value.isEmpty) {
                                  showSnackBar(context, 'Email is Empty');
                                  return;
                                }
                                if (signUpController.password.value.isEmpty) {
                                  showSnackBar(context, 'Password is Empty');
                                  return;
                                }
                                _isloading = true;
                                _redraw();
                                // print('WC ${phoneWC}');
                                // return;
                                if (phoneWC!.isNotEmpty) {
                                  await verifyPhoneNumber(
                                    signUpController.phone.value,
                                    context,
                                    () {},
                                  );
                                } else {
                                  var res = await ApiServices.register(
                                    signUpController.name.value,
                                    signUpController.email.value,
                                    signUpController.password.value,
                                    signUpController.phone.value,
                                    signUpController.image != null ? signUpController.image!.path : null,
                                  );
                                  _isloading = false;
                                  _redraw();
                                  if (res!) {
                                    Get.off(const EnableLocationScreen());
                                  } else {
                                    showSnackBar(context, 'Some Error Occur');
                                  }
                                }
                                // var res = await ApiServices.register(
                                //     name, email, password, phone, 'image');
                                // _isloading = false;
                                // _redraw();
                                // if (res!) {
                                //   Get.to(const OtpScreen());
                                // }
                              },
                              buttonColor: const Color(0xff95006F),
                              text: "Sign Up",
                              textColor: const Color(0xffFFFFFF),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Already have an account?",
                        fontColor: const Color(0xffC0C0C0),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(const LoginScreen());
                        },
                        child: CustomText(
                          text: "Sign In",
                          fontColor: const Color(0xff95006F),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // InkWell(
                  //   onTap: () {},
                  // child: CustomText(
                  //   text: "Skip",
                  //   textAlign: TextAlign.start,
                  //   fontColor: const Color(0xff5D3EBD),
                  //   fontSize: 16.sp,
                  //   fontWeight: FontWeight.w600,
                  // ),
                  // ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _redraw() {
    if (kDebugMode) setState(() {});
  }

  /// //////////////
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future verifyPhoneNumber(String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {
      // showSnackBar(context, "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed = (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent = (String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      // Get.to(const OtpScreen());
      signUpController.verificationId.value = verificationID;
      Get.to(const OtpScreen());
      // setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationID) {
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

  Widget imageProfile() {
    // print('imageLink ${imageLink!.isEmpty}');
    // print('imagePath ${_imageFile!.path}');
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 65,
            backgroundImage: _imageFile == null
                ? const AssetImage('assets/images/default_avatar.jpg')
                : imageLink != null && imageLink!.isNotEmpty
                    ? NetworkImage('$imageLink')
                    : FileImage(File(_imageFile!.path)) as ImageProvider,
          ),
          Positioned(
            bottom: 32,
            left: 100,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context, builder: (builder) => myBottomSheet());
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22,
                child: CircleAvatar(
                  backgroundColor: Color(0xff95006F),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myBottomSheet() {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  await takePhoto(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [Icon(Icons.camera_alt), Text('Camera')],
                ),
              ),
              InkWell(
                onTap: () async {
                  await takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [Icon(Icons.image), Text('Gallery')],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  ///
  Future checkAuth() async {
    print('loginController phone ${signUpController.phone.value}');
    var res = await ApiServices.register(
      signUpController.name.value,
      signUpController.email.value,
      signUpController.password.value,
      signUpController.phone.value,
      signUpController.image != null ? signUpController.image!.path : null,
    );
    _isloading = false;
    _redraw();
    if (res!) {
      Get.off(const EnableLocationScreen());
    } else {
      showSnackBar(context, 'Some Error Occur');
    }
  }

  ///
}
