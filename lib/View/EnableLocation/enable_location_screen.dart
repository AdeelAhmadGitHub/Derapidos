import 'package:derapidos/View/NavigationBar/navigationbar_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../consts/app_consts.dart';
import '../Custom Widget/button.dart';
import '../Custom Widget/custom_text.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({Key? key}) : super(key: key);

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  bool? _isloading = false;
  @override
  void initState() {
    // checkout();
    Get.to(NavigationbarScreen());
    super.initState();
  }

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
        child: Container(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100, top: 150, bottom: 40).r,
                  child: Image.asset(
                    "assets/images/Enable Location.png",
                    height: 177.h,
                    width: 144.w,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 43, right: 43).r,
                child: CustomText(
                  textAlign: TextAlign.start,
                  text: "Enable Your Location",
                  fontColor: AppColors().mainColor2,
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 33.h,
                width: 234.w,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: "Choose your location to start "
                      "find the request around you.",
                  fontColor: Color(0xffC0C0C0),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 50.h),
              _isloading!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30).r,
                      child: Container(
                        height: 55.h,
                        width: double.maxFinite.w,
                        child: MyCustomButton(
                          onPressed: () async {
                            _isloading = true;
                            _redraw();
                            await _determinePosition();
                            _isloading = false;
                            _redraw();
                            //Get.to(NavigationbarScreen());
                          },
                          height: 55.h,
                          width: double.maxFinite.w,
                          buttonColor: Color(0xffEC2547),
                          text: "Enable your Location",
                          textColor: Color(0xffFFFFFF),
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

  Future _determinePosition() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      print(statuses[Permission.location]);
    }

    if (await Permission.location.isRestricted) {
      print('location acces is restrictd');
    }
    print('position get started');
    Position? currentLocation = await Geolocator.getCurrentPosition();
    var staticPosition = currentLocation;
    print('static position $staticPosition');
    // cameraPosition = CameraPosition(
    //   target: LatLng(currentLocation.latitude, currentLocation.longitude),
    //   zoom: 14,
    // );

    // setState(() {
    //   longitudine = currentLocation.longitude;
    //   latitudine = currentLocation.latitude;
    //   _center = LatLng(latitudine, longitudine);
    // });
    setState(() {});
    return currentLocation;
  }
}
