import 'package:derapidos/View/Custom%20Widget/button.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/Custom%20Widget/text_field.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_consts.dart';

class DeleteReasons extends StatefulWidget {
  const DeleteReasons({Key? key}) : super(key: key);

  @override
  State<DeleteReasons> createState() => _DeleteReasonsState();
}

class _DeleteReasonsState extends State<DeleteReasons> {
  String? dropdownValue;

  bool? loading = false;

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50).r,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ).r,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xff444444),
                        ),
                        iconSize: 16,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      CustomText(
                        text: "Delete Reason",
                        fontColor: const Color(0xff444444),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // SizedBox(height: 40.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Select the Reason from below:',
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                      // Text(
                      //   'Select the Reason from below:',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 16.sp,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 65.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0).r,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 5.0,
                              color: Color(0xffE5E5E5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 10,
                            right: 10,
                          ).r,
                          child: DropdownButton<String>(
                            elevation: 16,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down_sharp),
                            // underline: Container(
                            //   decoration: const ShapeDecoration(
                            //     shape: RoundedRectangleBorder(
                            //       side: BorderSide(
                            //         width: 1.0,
                            //         style: BorderStyle.solid,
                            //       ),
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(5.0)),
                            //     ),
                            //   ),
                            // ),
                            hint: const Text('Select Reason'),
                            value: dropdownValue,
                            // items: List.generate(4, (index) {
                            //   var value = [index];
                            //   return DropdownMenuItem<String>(
                            //     value: value.toString(),
                            //     child: Text(
                            //       '${value} (${value})'.toUpperCase(),
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 15.sp,
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //     ),
                            //   );
                            // }),
                            ///
                            items: <String>[
                              'Abuse',
                              'Scam',
                              'Other',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: CustomText(
                                  text: value,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                ),
                                //  Text(
                                //   value,
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: 15.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              dropdownValue = newValue!;
                              dprint('  id $dropdownValue');
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30).r,
                  child: Container(
                    height: 160.h,
                    width: 315.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0).r,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5.0,
                          color: Color(0xffE5E5E5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18, left: 5, bottom: 10).r,
                      child: TextField(
                        minLines: 2,
                        maxLines: 9,
                        cursorColor: const Color(0xffC0C0C0),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4)
                              .r, // const EdgeInsets.all(13).r,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: "Type your Issue",
                          labelStyle: TextStyle(
                            decorationColor: Color(0xff4B5F61),
                            color: Color(0xff4B5F61),
                            fontFamily: "DMSans",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onChanged: (value) {
                          // controller.newAddress!.country = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                loading!
                    ? SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: CircularProgressIndicator(),
                      )
                    : MyCustomButton(
                        fontSize: 15.sp,
                        text: 'Submit',
                        height: 49,
                        width: 334,
                        buttonColor: const Color(0xff13446C),
                        onPressed: () async {
                          loading = true;
                          setState(() {});
                          var res = await ApiServices().deleteAccount();
                          loading = false;
                          setState(() {});
                          if (res!) {
                            showSnackBar(context, 'Account Deleted Successfully');
                          } else {
                            showSnackBar(context, 'Some Error Occur');
                          }
                        },
                      ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
