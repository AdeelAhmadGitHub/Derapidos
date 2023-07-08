// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../component/custom_card.dart';
// import '../../consts/app_consts.dart';
// import '../../controllers/home_controller.dart';
// import '../../models/FilterModel.dart';
// import '../Custom Widget/custom_text.dart';
// class FilterAndSort extends StatefulWidget {
//   const FilterAndSort({Key? key}) : super(key: key);
//
//   @override
//   State<FilterAndSort> createState() => _FilterAndSortState();
// }
//
// class _FilterAndSortState extends State<FilterAndSort> {
//   final homeCont=Get.put(HomeController());
//   @override
//   void initState() {
//     // TODO: implement initState
//     homeCont.searchAndFilter();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (homeController){return  homeController.loadingF.value
//         ? Scaffold(child: const CircularProgressIndicator())
//         :  Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 15.h),
//           Padding(
//             padding: EdgeInsets.only(left: 20..w, right: 20..w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CustomText4(
//                   text: "International Cuisines",
//                   fontColor: const Color(0xff262525),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10..h),
//           Container(
//             // padding: EdgeInsets.only(left: 15.w),
//             height: 175.h,
//             child: MediaQuery.removePadding(
//               context: context,
//               removeBottom: true,
//               child: ListView.builder(
//                 padding: EdgeInsets.only(left: 15.w),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: homeController
//                     .homepageproduct!
//                     .data!
//                     .internationalCuisinesRestaurants!
//                     .length, // 10,
//                 itemBuilder: (BuildContext context, int index) {
//                   InternationalCuisinesRestaurants product =
//                   homeController.filterModel!.data!
//                       .internationalCuisinesRestaurants![
//                   index];
//                   return GestureDetector(
//                     onTap: () {
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                         BorderRadius.circular(20.r),
//                       ),
//                       child: Container(
//                         width: 300.w,
//                         height: 130.h,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(0xffE5E5E5),
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(0, 0),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 130.h,
//                               width: 300.w,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   topRight: Radius.circular(10),
//                                 ),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius:
//                                     const BorderRadius.only(
//                                       topLeft:
//                                       Radius.circular(10),
//                                       topRight:
//                                       Radius.circular(10),
//                                     ),
//                                     child: SizedBox(
//                                       width: double.maxFinite,
//                                       child: Image.network(
//                                         "${product.logo}",
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 10.h,
//                                     left: 10.w,
//                                     right: 10.w,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         CustomCard(
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(
//                                                 5),
//                                             cardColor: const Color(
//                                                 0xffFFD10C),
//                                             cardChild: Padding(
//                                               padding: EdgeInsets
//                                                   .symmetric(
//                                                   horizontal:
//                                                   4.0.r,
//                                                   vertical:
//                                                   3.h),
//                                               child: Row(
//                                                 // mainAxisAlignment:
//                                                 //     MainAxisAlignment
//                                                 //         .spaceBetween,
//                                                 children: [
//                                                   Image.asset(
//                                                     "assets/images/aw.png",
//                                                     height:
//                                                     10.h,
//                                                     width: 11.w,
//                                                   ),
//                                                   SizedBox(
//                                                       width:
//                                                       3.w),
//                                                   CustomText(
//                                                     text:
//                                                     "Regular",
//                                                     fontSize:
//                                                     12.sp,
//                                                     fontColor:
//                                                     AppColors()
//                                                         .mainColor2,
//                                                   )
//                                                 ],
//                                               ),
//                                             )),
//                                         Icon(
//                                           Icons.favorite_border,
//                                           size: 26.sp,
//                                           color: Colors.white,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     left: 10.h,
//                                     top: 97.h,
//                                     child: CustomCard(
//                                       height: 19.h,
//                                       width: 45.w,
//                                       borderRadius:
//                                       BorderRadius.circular(
//                                           5),
//                                       cardColor: AppColors()
//                                           .mainColor2,
//                                       cardChild: Padding(
//                                         padding: EdgeInsets
//                                             .symmetric(
//                                             horizontal:
//                                             6.0.r,
//                                             vertical: 3.h),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceEvenly,
//                                           children: [
//                                             Icon(
//                                               Icons.star,
//                                               size: 15.r,
//                                               color: const Color(
//                                                   0xffFFD10C),
//                                             ),
//                                             CustomText(
//                                               text: "4.5",
//                                               fontColor:
//                                               Colors.white,
//                                               fontSize: 10.sp,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 2.h),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8.0.w),
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment
//                                     .spaceBetween,
//                                 children: [
//                                   CustomText(
//                                     text: "${product.name}",
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 18.sp,
//                                   ),
//                                   product.derapidosDeliveryCharges ==
//                                       ""
//                                       ? CustomText(
//                                     text: "Not Available",
//                                     fontColor: AppColors()
//                                         .mainColor2,
//                                   )
//                                       : Row(
//                                     children: [
//                                       Image.asset(
//                                         "assets/images/aa.png",
//                                         height: 15.h,
//                                         width: 15.w,
//                                       ),
//                                       SizedBox(
//                                           width: 5.w),
//                                       Image.asset(
//                                         "assets/images/ss.png",
//                                         height: 12.h,
//                                         width: 13.w,
//                                       ),
//                                       SizedBox(
//                                           width: 5.w),
//                                       CustomText(
//                                         text: product
//                                             .derapidosDeliveryCharges,
//                                         fontSize: 12.sp,
//                                         fontWeight:
//                                         FontWeight
//                                             .w500,
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 2.h),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8.0.w),
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment
//                                     .spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 170.w,
//                                     child: CustomText(
//                                       text: product.description,
//                                       textOverflow:
//                                       TextOverflow.ellipsis,
//                                       // text: "${product.marketName}",
//                                       fontColor: const Color(
//                                           0xff9B9B9B),
//                                       fontWeight:
//                                       FontWeight.w400,
//                                       fontSize: 12.sp,
//                                     ),
//                                   ),
//                                   product.restaurantDeliveryCharges ==
//                                       ""
//                                       ? CustomText(
//                                     text: "Not Available",
//                                     fontColor: AppColors()
//                                         .mainColor2,
//                                   )
//                                       : Row(
//                                     children: [
//                                       Image.asset(
//                                         "assets/images/rrr.png",
//                                         height: 15.h,
//                                         width: 15.w,
//                                       ),
//                                       SizedBox(
//                                           width: 5.w),
//                                       Image.asset(
//                                         "assets/images/ss.png",
//                                         height: 12.h,
//                                         width: 13.w,
//                                       ),
//                                       SizedBox(
//                                           width: 5.w),
//                                       SizedBox(
//                                         width: 20.w,
//                                         child: CustomText(
//                                           text: product
//                                               .restaurantDeliveryCharges
//                                               .toString(),
//                                           fontSize: 12.sp,
//                                           fontWeight:
//                                           FontWeight
//                                               .w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const Divider(height: 0),
//           SizedBox(height: 20..h),
//           Padding(
//             padding: EdgeInsets.only(left: 20..w, right: 20..w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText4(
//                   text: "Homemade & Local Cuisines",
//                   fontColor: const Color(0xff262525),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Container(
//             height: 185.h,
//             child: ListView.builder(
//               padding: EdgeInsets.only(left: 15.w),
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: homeController
//                   .filterModel!
//                   .data!
//                   .homemadeLocalCuisinesRestaurants!
//                   .length, // 10,
//               itemBuilder: (BuildContext context, int index) {
//                 HomemadeLocalCuisinesRestaurants? product =
//                 homeController.filterModel!.data!
//                     .homemadeLocalCuisinesRestaurants![
//                 index];
//                 return GestureDetector(
//                   onTap: () {
//                     // selectedIndex = index;
//                     // setState(() {});
//                     // homeController.currentRestaurantId =
//                     //     product.id.toString();
//                     // Get.to(const StoreDetailScreen());
//                   },
//                   child: Card(
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10),
//                       ),
//                     ),
//                     child: Container(
//                       width: 300.w,
//                       height: 150.h,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0xffE5E5E5),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 0),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 130.h,
//                             width: 300.w,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Stack(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius:
//                                   const BorderRadius.only(
//                                     topLeft:
//                                     Radius.circular(10),
//                                     topRight:
//                                     Radius.circular(10),
//                                   ),
//                                   child: SizedBox(
//                                     width: double.maxFinite,
//                                     child: Image.network(
//                                       "${product.logo}",
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 10.h,
//                                   left: 10.w,
//                                   right: 10.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       CustomCard(
//                                           borderRadius:
//                                           BorderRadius
//                                               .circular(5),
//                                           cardColor:
//                                           const Color(0xffFFD10C),
//                                           cardChild: Padding(
//                                             padding: EdgeInsets
//                                                 .symmetric(
//                                                 horizontal:
//                                                 4.0.r,
//                                                 vertical:
//                                                 4.h),
//                                             child: Row(
//                                               children: [
//                                                 Image.asset(
//                                                   "assets/images/aw.png",
//                                                   height: 10.h,
//                                                   width: 11.w,
//                                                 ),
//                                                 SizedBox(
//                                                     width: 3.w),
//                                                 CustomText(
//                                                   text:
//                                                   "Regular",
//                                                   fontSize:
//                                                   12.sp,
//                                                   fontColor:
//                                                   AppColors()
//                                                       .mainColor2,
//                                                 )
//                                               ],
//                                             ),
//                                           )),
//                                       Icon(
//                                         Icons.favorite_border,
//                                         size: 26.sp,
//                                         color: Colors.white,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 10.h,
//                                   top: 97.h,
//                                   child: CustomCard(
//                                     height: 19.h,
//                                     width: 45.w,
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         5),
//                                     cardColor:
//                                     AppColors().mainColor2,
//                                     cardChild: Padding(
//                                       padding:
//                                       EdgeInsets.symmetric(
//                                           horizontal:
//                                           6.0.r),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceEvenly,
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             size: 15.r,
//                                             color: const Color(
//                                                 0xffFFD10C),
//                                           ),
//                                           CustomText(
//                                             text: "4.5",
//                                             fontColor:
//                                             Colors.white,
//                                             fontSize: 10.sp,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 2.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0.w),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                               children: [
//                                 CustomText(
//                                   text: "${product.name}",
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 18.sp,
//                                 ),
//                                 product.derapidosDeliveryCharges ==
//                                     ""
//                                     ? CustomText(
//                                   text: "Not Available",
//                                   fontColor: AppColors()
//                                       .mainColor2,
//                                 )
//                                     : Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/aa.png",
//                                       height: 15.h,
//                                       width: 15.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     Image.asset(
//                                       "assets/images/ss.png",
//                                       height: 12.h,
//                                       width: 13.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     SizedBox(
//                                       width: 20.w,
//                                       child: CustomText(
//                                         text: product
//                                             .derapidosDeliveryCharges,
//                                         fontSize: 12.sp,
//                                         fontWeight:
//                                         FontWeight
//                                             .w500,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 2.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0.w),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: 170.w,
//                                   child: CustomText(
//                                     text: product.description,
//                                     textOverflow:
//                                     TextOverflow.ellipsis,
//                                     // text: "${product.marketName}",
//                                     fontColor:
//                                     const Color(0xff9B9B9B),
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12.sp,
//                                   ),
//                                 ),
//                                 product.restaurantDeliveryCharges ==
//                                     ""
//                                     ? CustomText(
//                                   text: "Not Available",
//                                   fontColor: AppColors()
//                                       .mainColor2,
//                                 )
//                                     : Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/rrr.png",
//                                       height: 15.h,
//                                       width: 15.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     Image.asset(
//                                       "assets/images/ss.png",
//                                       height: 12.h,
//                                       width: 13.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     SizedBox(
//                                       width: 20.w,
//                                       child: CustomText(
//                                         text: product
//                                             .restaurantDeliveryCharges
//                                             .toString(),
//                                         fontSize: 12.sp,
//                                         fontWeight:
//                                         FontWeight
//                                             .w500,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const Divider(height: 0),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText4(
//                   text: "Popular",
//                   fontColor: const Color(0xff262525),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20.sp,
//                 ),
//                 CustomText4(
//                   text: "View all",
//                   fontColor: AppColors().mainColor2,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 15.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Container(
//             padding: EdgeInsets.only(left: 15.w),
//             height: 185.h,
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: homeController.homepageproduct!.data!
//                   .popularRestaurants!.length, // 10,
//               itemBuilder: (BuildContext context, int index) {
//                 PopularRestaurants? product = homeController
//                     .filterModel!
//                     .data!
//                     .popularRestaurants![index];
//                 return GestureDetector(
//                   onTap: () {
//                     // selectedIndex = index;
//                     // setState(() {});
//                     // homeController.currentRestaurantId =
//                     //     product.id.toString();
//                     // Get.to(const StoreDetailScreen());
//                   },
//                   child: Card(
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10),
//                       ),
//                     ),
//                     child: Container(
//                       width: 300.w,
//                       height: 130.h,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0xffE5E5E5),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 0),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 130.h,
//                             width: 300.w,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Stack(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius:
//                                   const BorderRadius.only(
//                                     topLeft:
//                                     Radius.circular(10),
//                                     topRight:
//                                     Radius.circular(10),
//                                   ),
//                                   child: SizedBox(
//                                     width: double.maxFinite,
//                                     child: Image.network(
//                                       "${product.logo}",
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 10.h,
//                                   left: 10.w,
//                                   right: 10.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       CustomCard(
//                                         // height: 19.h,
//                                         // width: 62.w,
//                                           borderRadius:
//                                           BorderRadius
//                                               .circular(5),
//                                           cardColor:
//                                           const Color(0xffFFD10C),
//                                           cardChild: Padding(
//                                             padding: EdgeInsets
//                                                 .symmetric(
//                                                 horizontal:
//                                                 4.0.r,
//                                                 vertical:
//                                                 3.h),
//                                             child: Row(
//                                               children: [
//                                                 Image.asset(
//                                                   "assets/images/aw.png",
//                                                   height: 10.h,
//                                                   width: 11.w,
//                                                 ),
//                                                 SizedBox(
//                                                     width: 3.w),
//                                                 Row(
//                                                   children: [
//                                                     CustomText(
//                                                       text:
//                                                       "Regular ",
//                                                       fontSize:
//                                                       12.sp,
//                                                       fontColor:
//                                                       AppColors()
//                                                           .mainColor2,
//                                                     ),
//                                                     CustomText(
//                                                       text:
//                                                       " + 15% Discount",
//                                                       fontSize:
//                                                       12.sp,
//                                                       fontColor:
//                                                       AppColors()
//                                                           .mainColor2,
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           )),
//                                       Icon(
//                                         Icons.favorite_border,
//                                         size: 26.sp,
//                                         color: Colors.white,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 10.h,
//                                   top: 97.h,
//                                   child: CustomCard(
//                                     height: 19.h,
//                                     width: 45.w,
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         5),
//                                     cardColor:
//                                     AppColors().mainColor2,
//                                     cardChild: Padding(
//                                       padding:
//                                       EdgeInsets.symmetric(
//                                           horizontal:
//                                           6.0.r),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceEvenly,
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             size: 15.r,
//                                             color: const Color(
//                                                 0xffFFD10C),
//                                           ),
//                                           CustomText(
//                                             text: "4.5",
//                                             fontColor:
//                                             Colors.white,
//                                             fontSize: 10.sp,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 2.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0.w),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                               children: [
//                                 CustomText(
//                                   text: "${product.name}",
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 18.sp,
//                                 ),
//                                 product.derapidosDeliveryCharges ==
//                                     ""
//                                     ? CustomText(
//                                   text: "Not Available",
//                                   fontColor: AppColors()
//                                       .mainColor2,
//                                 )
//                                     : Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/aa.png",
//                                       height: 15.h,
//                                       width: 15.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     Image.asset(
//                                       "assets/images/ss.png",
//                                       height: 12.h,
//                                       width: 13.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     CustomText(
//                                       text: "25mins",
//                                       fontSize: 12.sp,
//                                       fontWeight:
//                                       FontWeight.w500,
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 2.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0.w),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: 170.w,
//                                   child: CustomText(
//                                     text: product.description,
//                                     textOverflow:
//                                     TextOverflow.ellipsis,
//                                     // text: "${product.marketName}",
//                                     fontColor:
//                                     const Color(0xff9B9B9B),
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12.sp,
//                                   ),
//                                 ),
//                                 product.restaurantDeliveryCharges ==
//                                     ""
//                                     ? CustomText(
//                                   text: "Not Available",
//                                   fontColor: AppColors()
//                                       .mainColor2,
//                                 )
//                                     : Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/rrr.png",
//                                       height: 15.h,
//                                       width: 15.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     Image.asset(
//                                       "assets/images/ss.png",
//                                       height: 12.h,
//                                       width: 13.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     CustomText(
//                                       text: product
//                                           .restaurantDeliveryCharges
//                                           .toString(),
//                                       fontSize: 12.sp,
//                                       fontWeight:
//                                       FontWeight.w500,
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const Divider(height: 0),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText4(
//                   text: "Discounted",
//                   fontColor: const Color(0xff262525),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20.sp,
//                 ),
//                 CustomText4(
//                   text: "View all",
//                   fontColor: AppColors().mainColor2,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 15.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Container(
//             padding: EdgeInsets.only(left: 15.w),
//             height: 185.h,
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: homeController.homepageproduct!.data!
//                   .discountedRestaurants!.length, // 10,
//               itemBuilder: (BuildContext context, int index) {
//                 DiscountedRestaurants? product = homeController
//                     .filterModel!
//                     .data!
//                     .discountedRestaurants![index];
//                 return GestureDetector(
//                   onTap: () {
//                     // selectedIndex = index;
//                     // setState(() {});
//                     // homeController.currentRestaurantId =
//                     //     product.id.toString();
//                     // Get.to(const StoreDetailScreen());
//                   },
//                   child: Card(
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10),
//                       ),
//                     ),
//                     child: Container(
//                       width: 300.w,
//                       height: 130.h,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0xffE5E5E5),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 0),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 130.h,
//                             width: 300.w,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                             ),
//                             child: Stack(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius:
//                                   const BorderRadius.only(
//                                     topLeft:
//                                     Radius.circular(10),
//                                     topRight:
//                                     Radius.circular(10),
//                                   ),
//                                   child: SizedBox(
//                                     width: double.maxFinite,
//                                     child: Image.network(
//                                       "${product.logo}",
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 10.h,
//                                   left: 10.w,
//                                   right: 10.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       CustomCard(
//                                           borderRadius:
//                                           BorderRadius
//                                               .circular(5),
//                                           cardColor:
//                                           const Color(0xffFFD10C),
//                                           cardChild: Padding(
//                                             padding: EdgeInsets
//                                                 .symmetric(
//                                                 horizontal:
//                                                 4.0.r,
//                                                 vertical:
//                                                 3.h),
//                                             child: Row(
//                                               children: [
//                                                 Image.asset(
//                                                   "assets/images/aw.png",
//                                                   height: 10.h,
//                                                   width: 11.w,
//                                                 ),
//                                                 SizedBox(
//                                                     width: 3.w),
//                                                 Row(
//                                                   children: [
//                                                     CustomText(
//                                                       text:
//                                                       "Regular",
//                                                       fontSize:
//                                                       12.sp,
//                                                       fontColor:
//                                                       AppColors()
//                                                           .mainColor2,
//                                                     ),
//                                                     CustomText(
//                                                       text:
//                                                       " 25%-Unlimited",
//                                                       fontSize:
//                                                       12.sp,
//                                                       fontColor:
//                                                       AppColors()
//                                                           .mainColor2,
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           )),
//                                       Icon(
//                                         Icons.favorite_border,
//                                         size: 26.sp,
//                                         color: Colors.white,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 10.h,
//                                   top: 97.h,
//                                   child: CustomCard(
//                                     height: 19.h,
//                                     width: 45.w,
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         5),
//                                     cardColor:
//                                     AppColors().mainColor2,
//                                     cardChild: Padding(
//                                       padding:
//                                       EdgeInsets.symmetric(
//                                           horizontal:
//                                           6.0.r),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceEvenly,
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             size: 15.r,
//                                             color: const Color(
//                                                 0xffFFD10C),
//                                           ),
//                                           CustomText(
//                                             text: "4.5",
//                                             fontColor:
//                                             Colors.white,
//                                             fontSize: 10.sp,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 2.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0.w),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                               children: [
//                                 CustomText(
//                                   text: "${product.name}",
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 18.sp,
//                                 ),
//                                 product.derapidosDeliveryCharges ==
//                                     ""
//                                     ? CustomText(
//                                   text: "Not Available",
//                                   fontColor: AppColors()
//                                       .mainColor2,
//                                 )
//                                     : Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/aa.png",
//                                       height: 15.h,
//                                       width: 15.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     Image.asset(
//                                       "assets/images/ss.png",
//                                       height: 12.h,
//                                       width: 13.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     SizedBox(
//                                       width: 20.w,
//                                       child: CustomText(
//                                         text: product
//                                             .derapidosDeliveryCharges,
//                                         fontSize: 12.sp,
//                                         fontWeight:
//                                         FontWeight
//                                             .w500,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 2.h),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0.w),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: 170.w,
//                                   child: CustomText(
//                                     text: product.description,
//                                     textOverflow:
//                                     TextOverflow.ellipsis,
//                                     // text: "${product.marketName}",
//                                     fontColor:
//                                     const Color(0xff9B9B9B),
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12.sp,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/rrr.png",
//                                       height: 15.h,
//                                       width: 15.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     Image.asset(
//                                       "assets/images/ss.png",
//                                       height: 12.h,
//                                       width: 13.w,
//                                     ),
//                                     SizedBox(width: 5.w),
//                                     SizedBox(
//                                       width: 20.w,
//                                       child: CustomText(
//                                         text: product
//                                             .restaurantDeliveryCharges
//                                             .toString(),
//                                         fontSize: 12.sp,
//                                         fontWeight:
//                                         FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const Divider(height: 0),
//           SizedBox(height: 20.h),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20).r,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CustomText2(
//                   text: "Restaurants Nearby",
//                   fontColor: const Color(0xff262525),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20.h),
//           Container(
//             padding: const EdgeInsets.only(left: 15, right: 15),
//             //height: 300.h, // 400.h,
//             width: double.infinity.w,
//             child: ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: homeController.filterModel!.data!
//                   .nearbyRestaurants!.length, // 10,
//               itemBuilder: (BuildContext context, int index) {
//                 var restaurant = homeController.filterModel!
//                     .data!.nearbyRestaurants![index];
//                 return GestureDetector(
//                   onTap: () {
//                     // selectedIndex = index;
//                     // setState(() {});
//                     // homeController.currentRestaurantId =
//                     //     restaurant.id.toString();
//                     // Get.to(const StoreDetailScreen());
//                   },
//                   //  onTap: () {Get.to(SignUpScreen());},
//
//                   child: Column(
//                     children: [
//                       Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius:
//                             BorderRadius.circular(10),
//                             boxShadow: const [
//                               BoxShadow(
//                                 offset: Offset(0, 0),
//                                 blurRadius: 5.0,
//                                 spreadRadius: 2,
//                                 color: Color(0xffE5E5E5),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               Stack(
//                                 children: [
//                                   SizedBox(
//                                     height: 100.h,
//                                     width: 100.w,
//                                     child: ClipRRect(
//                                       borderRadius:
//                                       const BorderRadius.only(
//                                         topLeft:
//                                         Radius.circular(10),
//                                         bottomLeft:
//                                         Radius.circular(10),
//                                       ),
//                                       child: Image.network(
//                                         "${restaurant.logo}",
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 5.h,
//                                     left: 5.w,
//                                     child: CircleAvatar(
//                                       radius: 7.r,
//                                       backgroundColor:
//                                       Colors.red,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(width: 10.w),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.only(
//                                           right: 10),
//                                       child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                           children: [
//                                             CustomText(
//                                               // text: "${restaurant.name}",
//                                               text:
//                                               "${restaurant.name}",
//                                               fontColor:
//                                               const Color(
//                                                   0xff262525),
//                                               fontWeight:
//                                               FontWeight
//                                                   .w500,
//                                               fontSize: 16.sp,
//                                             ),
//                                             // const Spacer(flex: 5),
//                                             CustomCard(
//                                                 height: 20.h,
//                                                 // width: 89.w,
//                                                 borderRadius:
//                                                 BorderRadius
//                                                     .circular(
//                                                     7),
//                                                 cardColor:
//                                                 AppColors()
//                                                     .mainColor2,
//                                                 cardChild: Row(
//                                                   children: [
//                                                     SizedBox(
//                                                         width: 4
//                                                             .w),
//                                                     Image.asset(
//                                                       "assets/images/rrr.png",
//                                                       height:
//                                                       15.h,
//                                                       width:
//                                                       15.w,
//                                                     ),
//                                                     SizedBox(
//                                                         width: 4
//                                                             .w),
//                                                     Image.asset(
//                                                       "assets/images/ss.png",
//                                                       height:
//                                                       12.h,
//                                                       width:
//                                                       13.w,
//                                                       color: Colors
//                                                           .white,
//                                                     ),
//                                                     SizedBox(
//                                                         width: 4
//                                                             .w),
//                                                     CustomText(
//                                                       text: restaurant
//                                                           .time,
//                                                       fontSize:
//                                                       12.sp,
//                                                       fontColor:
//                                                       Colors
//                                                           .white,
//                                                       fontWeight:
//                                                       FontWeight
//                                                           .w500,
//                                                     ),
//                                                     SizedBox(
//                                                         width:
//                                                         4.w)
//                                                   ],
//                                                 )),
//                                           ]),
//                                     ),
//                                     SizedBox(height: 8.w),
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.only(
//                                           right: 10),
//                                       child: Row(
//                                         children: [
//                                           const Icon(
//                                             Icons
//                                                 .location_on_outlined,
//                                             size: 15,
//                                             color: Color(
//                                                 0xff262525),
//                                           ),
//                                           SizedBox(width: 5.w),
//                                           SizedBox(
//                                             width: 100.w,
//                                             child: CustomText(
//                                               text:
//                                               "${restaurant.address}",
//                                               textOverflow:
//                                               TextOverflow
//                                                   .ellipsis,
//                                               //  text: "Majeedhee Magu Rd, Malé, Maldives",
//                                               fontColor:
//                                               const Color(
//                                                   0xff262525),
//                                               fontWeight:
//                                               FontWeight
//                                                   .w500,
//                                               fontSize: 10.sp,
//                                             ),
//                                           ),
//                                           const Spacer(),
//                                           CustomCard(
//                                               height: 20.h,
//                                               // width: 89.w,
//                                               borderRadius:
//                                               BorderRadius
//                                                   .circular(
//                                                   7),
//                                               cardColor:
//                                               AppColors()
//                                                   .mainColor2,
//                                               cardChild: Row(
//                                                 children: [
//                                                   SizedBox(
//                                                       width:
//                                                       4.w),
//                                                   Image.asset(
//                                                     "assets/images/aa.png",
//                                                     height:
//                                                     15.h,
//                                                     width: 15.w,
//                                                   ),
//                                                   SizedBox(
//                                                       width:
//                                                       4.w),
//                                                   Image.asset(
//                                                     "assets/images/ss.png",
//                                                     height:
//                                                     12.h,
//                                                     width: 13.w,
//                                                     color: Colors
//                                                         .white,
//                                                   ),
//                                                   SizedBox(
//                                                       width:
//                                                       4.w),
//                                                   CustomText(
//                                                     text: restaurant
//                                                         .time,
//                                                     fontSize:
//                                                     12.sp,
//                                                     fontColor:
//                                                     Colors
//                                                         .white,
//                                                     fontWeight:
//                                                     FontWeight
//                                                         .w500,
//                                                   ),
//                                                   SizedBox(
//                                                       width:
//                                                       4.w)
//                                                 ],
//                                               )),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(height: 15.h),
//                                     Row(
//                                       children: [
//                                         CustomText(
//                                           text:
//                                           "Min. Order CFA ${restaurant.derapidosDeliveryCharges}",
//                                           // text: "\$4.00",
//
//                                           fontWeight:
//                                           FontWeight.w500,
//                                           fontSize: 12.sp,
//                                         ),
//                                         SizedBox(width: 13.w),
//                                         const Icon(
//                                           Icons.star,
//                                           color:
//                                           Color(0xffFFC107),
//                                           size: 12,
//                                         ),
//                                         // SizedBox(width: 16.w),
//                                         CustomText(
//                                           text:
//                                           "${restaurant.averageRating}",
//                                           // text: "4.5",
//
//                                           fontWeight:
//                                           FontWeight.w500,
//                                           fontSize: 12.sp,
//                                         ),
//                                         SizedBox(width: 10.w),
//                                         CustomText(
//                                           text: restaurant
//                                               .distance,
//                                           // "${restaurant.distance} mins",
//                                           fontWeight:
//                                           FontWeight.w500,
//                                           fontSize: 12.sp,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 32.h),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       const SizedBox(height: 25)
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );});
//
//   }
// }
