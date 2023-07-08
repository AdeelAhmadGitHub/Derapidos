import 'dart:convert';
import 'dart:math';

import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/controllers/r_s_controller/add_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/update_location_controller.dart';
import 'package:get/get.dart';

class RSLocationScreen extends StatefulWidget {
  RSLocationScreen({Key? key}) : super(key: key);

  @override
  State<RSLocationScreen> createState() => _RSLocationScreenState();
}

class _RSLocationScreenState extends State<RSLocationScreen> {
  TextEditingController textEditingController = TextEditingController();
  var controller = Get.put(AddPropertyController());

  var uuid = Uuid();

  String? _sessingToken = "1234";
  List placeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessingToken == null) {
      setState(() {
        _sessingToken = uuid.v4();
      });
    }
    getSuggestion(textEditingController.text);
  }

  void getSuggestion(String input) async {
    String apiKey = "AIzaSyBx95Bvl9O-US2sQpqZ41GdsHIprnXvJv8";
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$apiKey&sessiontoken=$_sessingToken';

    var response = await http.get(Uri.parse(request));
    print(response.body.toString());
    if (response.statusCode == 200) {
      setState(() {
        placeList = jsonDecode(response.body.toString())["predictions"];
      });
    } else {
      throw Exception("location failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5..w),
          child: Column(
            children: [
              CustomCard(
                height: 120..h,
                cardColor: Colors.black12,
                cardChild: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        CustomText(
                          text: "Locations",
                          fontSize: 16.sp,
                          fontColor: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    CustomCard(
                      height: 40..h,
                      width: 250..w,
                      cardColor: Colors.white,
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(5),
                      cardChild: Center(
                        child: TextField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(
                  placeList.length,
                  (index) => ListTile(
                    title: CustomText(
                      text: placeList[index]["description"],
                    ),
                    onTap: () async {
                      List<Location> location = await locationFromAddress(placeList[index]["description"]);
                      Get.back(result: [location, placeList[index]["description"]]);
                       print(location.single.latitude);
                       print(location.single.longitude);
                       double l=location.single.latitude;
                       double lo=location.single.longitude;
                      controller.latitudeL='${l}';
                      controller.longitudeL='${lo}';
                      //log('data: ${controller.longitudeL}');
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
