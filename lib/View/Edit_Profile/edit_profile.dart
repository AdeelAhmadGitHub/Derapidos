import 'dart:io';

import 'package:derapidos/View/Custom%20Widget/button.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/theme.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../consts/app_consts.dart';
import '../Custom Widget/custom_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // var homeController = Get.put(HomeController());
  HomeController homeController = Get.find();
  bool isSelected = false;
  var _isloading = false;
  bool? _isObscureP = true;
  // bool? _isObscureCP = true;
  //
  String? name = '', email = '', phone = '', password = '', cPassword = '', phoneWC = '';
  // String? imageLink;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  // bool? _loading = false;

  // @override
  // initState() {
  //   homeController.getProfile();
  //   // homeController.editProfileLoading.value = false;
  //   // imageLink = homeController.userProfile!.userData!.profilePic;
  //   // setState(() {});
  //   super.initState();
  // }

  // var signUpController = Get.put(SignUpController());

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
      // signUpController.image = _imageFile;
      homeController.userData!.profilePic = _imageFile!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return
            // homeController.profileLoading.value
            //     ? const CircularProgressIndicator()
            //     :
            Scaffold(
              backgroundColor: Color(0xF8F8F8F4),
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
            child: SingleChildScrollView(
              child: Container(
                //padding: const EdgeInsets.only(left: 30, right: 30, top: 40).r,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          Container(
                            height: 50.h,
                            width: double.maxFinite.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(15.0.r),
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
                              controller: TextEditingController(
                                text: '${homeController.userData!.name}',
                              ),
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
                                  borderRadius: BorderRadius.circular(15.0.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15.0.r),
                                ),
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                  color: const Color(0xffC0C0C0),
                                  fontFamily: "DMSans",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onChanged: (value) {
                                name = value;
                                homeController.userData!.name = value;
                                // signUpController.name.value = value;
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 50.h,
                            width: double.maxFinite.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(15.0.r),
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
                              controller: TextEditingController(
                                text: '${homeController.userData!.email}',
                              ),
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
                                  borderRadius: BorderRadius.circular(15.0.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                hintText: "Your Email",
                                hintStyle: TextStyle(
                                  color: const Color(0xffC0C0C0),
                                  fontFamily: 'DMSans',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onChanged: (value) {
                                email = value;
                                homeController.userData!.email = value;
                                // signUpController.email.value = value;
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),

                          /// Phone Number Field
                          Container(
                            height: 50.h,
                            width: double.maxFinite.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(15.0.r),
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
                                controller: TextEditingController(
                                  text: '${homeController.userData!.phone}',
                                ),
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
                                    AssetImage("assets/images/phoneIcon.png"),
                                    color: Color(0xffC0C0C0),
                                    size: 18,
                                  ),
                                  labelStyle: TextStyle(
                                    color: const Color(0xffC0C0C0),
                                    fontFamily: 'DMSans',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.0.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15.r),
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
                                showCountryFlag: false,
                                disableLengthCheck: true,
                                cursorColor: const Color(0xff959EA7),
                                initialCountryCode: 'PK', // 'US',
                                onChanged: (phone) {
                                  homeController.userData!.phone = //value;
                                      // signUpController.phone.value =
                                      phone.countryCode + phone.number;
                                  phoneWC = phone.number;
                                  print('phone ${homeController.userData!.phone}');
                                },
                              ),
                            ),
                          ),

                          ///
                          SizedBox(height: 20.h),
                          Container(
                            height: 50.h,
                            width: double.maxFinite.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(15.0.r),
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
                                  AssetImage("assets/images/lock.png"),
                                  color: Color(0xffC0C0C0),
                                  size: 18,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscureP! ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                                    size: 15,
                                    color: const Color.fromARGB(248, 192, 192, 192),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscureP = !_isObscureP!;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15.0.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15.0.r),
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
                                homeController.userData!.deviceToken = value;
                                // signUpController.password.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    controller.editProfileLoading.value
                        //     ? const CircularProgressIndicator()
                        //     :
                        // _isloading
                        ? const CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: SizedBox(
                              height: 50.h,
                              width: double.maxFinite.w,
                              child: MyCustomButton(
                                height: 50.h,
                                width: double.maxFinite,
                                onPressed: () async {
                                  //
                                  if (homeController.userData!.name!.isEmpty) {
                                    showSnackBar(context, 'Name is Empty');
                                    return;
                                  }
                                  if (homeController.userData!.email!.isEmpty) {
                                    showSnackBar(context, 'Email is Empty');
                                    return;
                                  }
                                  if (homeController.userData!.phone!.isEmpty) {
                                    showSnackBar(context, 'Phone is Empty');
                                    return;
                                  }
                                  if (homeController.userData!.deviceToken!.isEmpty) {
                                    showSnackBar(context, 'Password is Empty');
                                    return;
                                  }

                                  _isloading = true;
                                  _redraw();
                                  var res = await homeController.editProfile();
                                  // ApiServices().editProfile(homeController.userData);
                                  _isloading = false;
                                  _redraw();
                                  if (res!) {
                                    showSnackBar(context, 'Changes Done Successfully');
                                    Get.back();
                                  } else {
                                    showSnackBar(context, 'Some Error Occur');
                                  }
                                },
                                buttonColor: const Color(0xffEC2547),
                                text: "Update",
                                textColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _redraw() {
    if (kDebugMode) setState(() {});
  }

  Widget imageProfile(imageUrl) {
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
                // ? const AssetImage('assets/images/default_avatar.jpg')
                // : homeController.userProfile!.userData!.profilePic!.isNotEmpty
                //  imageLink != null && imageLink!.isNotEmpty
                ? NetworkImage(imageUrl) // NetworkImage('$imageLink')
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
                  backgroundColor: AppTheme.appColor,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.appColor,
              fontFamily: AppTheme.fontfamily,
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
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: AppTheme.appColor,
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.appColor,
                        fontFamily: AppTheme.fontfamily,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      color: AppTheme.appColor,
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.appColor,
                        fontFamily: AppTheme.fontfamily,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
