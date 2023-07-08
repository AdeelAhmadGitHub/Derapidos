import 'package:derapidos/View/Login/login_screen.dart';
import 'package:derapidos/View/My%20Cart/mycart_screen.dart';
import 'package:derapidos/View/Store%20Details/service_products.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/cart_controller.dart';
import 'package:derapidos/controllers/favorites_controller.dart';
import 'package:derapidos/controllers/home_controller.dart';
import 'package:derapidos/models/categories.dart';
import 'package:derapidos/models/restaurant_detail.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Custom Widget/custom_text.dart';
import '../Product Details/product_details.dart';
import '../list/burger_list.dart';

class StoreDetailScreen1 extends StatefulWidget {
  const StoreDetailScreen1({Key? key}) : super(key: key);

  @override
  State<StoreDetailScreen1> createState() => _StoreDetailScreenState1();
}

class _StoreDetailScreenState1 extends State<StoreDetailScreen1> with TickerProviderStateMixin {
  int currentSelected = 0;

  // List<String> jobsTypes = [
  //   "Promo",
  //   "Meals",
  //   "Burgers",
  //   "Chicken",
  // ];
  // List screens = [
  //   const Promo(),
  //   const Meale(),
  //   const Burgers(),
  //   const Chicken(),
  // ];
  bool selected = true;
  var homeController = Get.put(HomeController());
  var favoritesController = Get.put(FavoritesController());
  var cartController = Get.put(CartController());

  // String? currentCategoryId = '';

  @override
  initState() {
    gotcallf();

    // setState(() {});
    super.initState();
  }

  gotcallf() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      //log('datansdlaslasljlajlaajlaJLas');
      homeController.getStoreDetail();
    } else {
      //log('uytrtyuiolkjhgcvbnm');
      cartController.getCartData();
      homeController.getStoreDetail();
    }
  }

  makeItFavorite(BuildContext context, StoreProduct product) async {
    showLoading(context);
    favoritesController.assignProductFromStoreDetail(product);
    var res1 = await favoritesController.addToFavorites();
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (res1!) {
      showSnackBar(context, 'Added to Favorite Successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return GetX<HomeController>(
      builder: (homeController) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
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
          body: homeController.rdLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SizedBox(
                      height: 320.h,
                      child: Stack(
                        children: [
                          Container(
                            height: 265.h,
                            width: 375.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r),
                              ),
                              image: DecorationImage(
                                // image: AssetImage("assets/images/StoreImage.png"),
                                image: NetworkImage("${homeController.restaurantDetails!. //
                                    data!.marketDetails!.bannerImage}"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 130.h).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(const MycartScreen());
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 40.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFEBD00),
                                            borderRadius: BorderRadius.circular(3.r),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 22.w,
                                          child: CustomText(
                                            text: cartController.cartLength?.value.toString(),
                                            fontColor: Colors.black.withOpacity(.5),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 200.h,
                            left: 20.w,
                            right: 20.w,
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 5.0,
                                    color: Color(0xffE5E5E5),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "${homeController.restaurantDetails!. //
                                              data!.marketDetails!.name}",
                                          // text: "Burger King",
                                          fontColor: const Color(0xff444444),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Color(0xffFFC107),
                                            ),
                                            SizedBox(width: 5.w),
                                            CustomText(
                                              text: "${homeController.restaurantDetails!. //
                                                  data!.marketDetails!.averageRating}",
                                              // fontColor: const Color(
                                              //     0xffEC2547),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                            ),
                                            SizedBox(width: 8.w),
                                            CustomText(
                                              text:
                                                  "(${homeController.restaurantDetails!.data!.marketDetails!.totalReviews})",

                                              // fontColor: const Color(
                                              //     0xffEC2547),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 9.r,
                                          color: const Color(0xff9098B1),
                                        ),
                                        SizedBox(
                                          width: 250.w,
                                          child: CustomText(
                                            text: "${homeController.restaurantDetails!. //
                                                data!.marketDetails!.address}",
                                            textOverflow: TextOverflow.ellipsis,
                                            // text: "Majeedhee Magu Rd, Malé, Maldives",
                                            fontColor: const Color(0xff9098B1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        const Spacer(),
                                        CustomText(
                                          text: homeController
                                              .restaurantDetails!.data!.marketDetails!.openStatus,
                                          fontColor: const Color(0xffFEBD00),
                                          fontSize: 10.sp,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CustomText(
                                              text: "Min.Order",
                                              fontSize: 14..sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(width: 5..w),
                                            CustomText(
                                              text:
                                                  "${homeController.restaurantDetails!.data!.marketDetails!.minimumOrderPrice} CFA",
                                              fontColor: AppColors().mainColor2,
                                              fontSize: 14..sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            homeController.restaurantDetails!.data!.marketDetails!
                                                        .derapidosDeliveryCharges ==
                                                    "Not"
                                                ? CustomText(
                                                    text: "",
                                                    fontColor: AppColors().mainColor2,
                                                  )
                                                : Row(
                                                    // children: [
                                                    //   Row(
                                                    //     children: [
                                                    //       Image.asset(
                                                    //         "assets/images/aaa.png",
                                                    //         height:
                                                    //             15.h,
                                                    //         width: 15.w,
                                                    //       ),
                                                    //       SizedBox(
                                                    //           width:
                                                    //               5.w),
                                                    //       Image.asset(
                                                    //         "assets/images/ss.png",
                                                    //         height:
                                                    //             15.h,
                                                    //         width: 15.w,
                                                    //       ),
                                                    //       SizedBox(
                                                    //           width:
                                                    //               5.w),
                                                    //       Row(
                                                    //         children: [
                                                    //           SizedBox(
                                                    //             width: 25
                                                    //               ..w,
                                                    //             height: 20
                                                    //               ..h,
                                                    //             child:
                                                    //                 CustomText(
                                                    //               text: "${homeController.restaurantDetails!.data!.marketDetails!.derapidosDeliveryCharges}" ??
                                                    //                   "",
                                                    //               fontSize:
                                                    //                   12.sp,
                                                    //               fontWeight:
                                                    //                   FontWeight.w500,
                                                    //             ),
                                                    //           ),
                                                    //           CustomText(
                                                    //             text:
                                                    //                 "CFA",
                                                    //             fontSize:
                                                    //                 12.sp,
                                                    //             fontWeight:
                                                    //                 FontWeight.w500,
                                                    //           ),
                                                    //         ],
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    //   SizedBox(
                                                    //       width: 10.w),
                                                    // ],
                                                    ),
                                            SizedBox(height: 5.h),
                                            homeController.restaurantDetails!.data!.marketDetails!
                                                        .restaurantDeliveryCharges ==
                                                    ""
                                                ? CustomText(
                                                    text: "",
                                                    fontColor: AppColors().mainColor2,
                                                  )
                                                : Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/rrrr.png",
                                                            height: 15.h,
                                                            width: 15.w,
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          Image.asset(
                                                            "assets/images/ss.png",
                                                            height: 15.h,
                                                            width: 15.w,
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 25..w,
                                                                height: 20..h,
                                                                child: CustomText(
                                                                  text:
                                                                      "${homeController.restaurantDetails!.data!.marketDetails!.restaurantDeliveryCharges}" ??
                                                                          "",
                                                                  fontSize: 12.sp,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              CustomText(
                                                                text: "CFA",
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 10.w),
                                                    ],
                                                  ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/ss.png",
                                              height: 18.h,
                                              width: 18.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            CustomText(
                                              text: "CFA",
                                              fontColor: AppColors().mainColor2,
                                              fontSize: 14..sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            CustomText(
                                              text:
                                                  "${homeController.restaurantDetails!.data!.marketDetails!.time}",
                                              fontColor: AppColors().mainColor2,
                                              fontSize: 14..sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                //This is for background color
                                color: Colors.white.withOpacity(0.0),

                                //This is for bottom border that is needed
                                border: Border(
                                    bottom: BorderSide(
                                        color: const Color(0xffC0C0C087).withOpacity(.53), width: 2.sp)),
                              ),
                              child: TabBar(
                                  controller: tabController,
                                  isScrollable: false,
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    right: 0,
                                  ).r,
                                  indicatorColor: AppColors().mainColor2,
                                  labelColor: AppColors().mainColor2,
                                  labelStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  unselectedLabelColor: Colors.black,
                                  unselectedLabelStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  tabs: const [
                                    Tab(
                                      text: "Products",
                                    ),
                                    Tab(
                                      text: "Ratings",
                                    ),
                                    Tab(
                                      text: "About",
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TabBarView(
                            controller: tabController,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: SizedBox(
                                      // height: 100.h,
                                      // width: double.maxFinite,
                                      child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 0.9,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 2,
                                        ),

                                        itemCount:
                                            homeController.restaurantDetails!.data!.categoryList!.length,
                                        // jobsTypes.length,
                                        itemBuilder: (context, index) {
                                          Category? category =
                                              homeController.restaurantDetails!.data!.categoryList![index];
                                          return GestureDetector(
                                            onTap: () {
                                              currentSelected = index;
                                              homeController.currentCategoryId = category.id.toString();
                                              setState(() {});
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 70,
                                                  padding:
                                                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: currentSelected == index
                                                        ? const Color(0xff95006F)
                                                        : const Color(0xffFFFFFF),
                                                    // borderRadius: BorderRadius.circular(10.0.r),
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
                                                    child: Image.network(
                                                      "${category.image}",
                                                      height: 30,
                                                      width: 60,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${category.name}",
                                                  // jobsTypes[index],
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "DMSans",
                                                    color: const Color(0xff444444),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 25.h),
                                  Expanded(
                                    child: Wrap(
                                      runSpacing: 50,
                                      spacing: 10,
                                      children: homeController.restaurantDetails!.data!.productList!.data!
                                          .map((product) {
                                        return homeController.currentCategoryId != product.categoryId
                                            ? Container()
                                            : Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      bool? isLogin =
                                                          await UserPreferences.getLoginCheck() ?? false;
                                                      if (isLogin == false) {
                                                        //log('datansdlaslasljlajlaajlaJLas');
                                                        Get.to(const LoginScreen());
                                                      } else {
                                                        //log('uytrtyuiolkjhgcvbnm');
                                                        homeController.currentProductId = product.id;
                                                        Get.to(const ProductDetails());
                                                      }
                                                      // await takePhoto(ImageSource.gallery);
                                                    },
                                                    child: Container(
                                                      height: 160.h,
                                                      width: 100.w,
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xffffffff),
                                                        border: Border.all(
                                                            width: 2,
                                                            color: product.isAddToCart ?? false
                                                                ? const Color(0xff95006F)
                                                                : Colors.transparent),
                                                        borderRadius: BorderRadius.circular(5.r),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            offset: Offset(0, 0),
                                                            blurRadius: 5.0,
                                                            color: Color(0xffE5E5E5),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          SizedBox(
                                                            height: 80.h,
                                                            width: 80.w,
                                                            // height: 111.h,
                                                            // width: 92.w,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(5.r),
                                                                topRight: Radius.circular(5.r),
                                                              ),
                                                              child: Image.network(product.image!
                                                                  // fit: BoxFit
                                                                  //     .cover,
                                                                  ),
                                                            ),
                                                          ),
                                                          Column(
                                                            // crossAxisAlignment:
                                                            //     CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 5.h),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.symmetric(horizontal: 4),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    CustomText(
                                                                      text: "${product.name}",
                                                                      // text: "Chef’s Burger",
                                                                      fontColor: const Color(0xff000000),
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14.sp,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(height: 5.h),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.symmetric(horizontal: 4),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    CustomText(
                                                                      text: "\CFA ${product.price}",
                                                                      // text: burgerListModel[index].text1,
                                                                      fontColor: const Color(0xffEC2547),
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 10.sp,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(height: 5.h),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  product.isAddToCart ?? false
                                                      ? SizedBox(
                                                          width: 100.w,
                                                          child: Align(
                                                            alignment: Alignment.topRight,
                                                            child: Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () async {
                                                                    product.isLoadingShow = true;
                                                                    setState(() {});
                                                                    cartController.quantityU =
                                                                        cartController.quantityU + 1;
                                                                    cartController.productIdU = product.id;
                                                                    bool? isSuccess = await cartController
                                                                        .updateCartProductQuantity();
                                                                    if (isSuccess ?? true) {
                                                                      product.updateQuantity =
                                                                          (product.updateQuantity! + 1);
                                                                      product.isLoadingShow = false;
                                                                      setState(() {});
                                                                    } else {
                                                                      cartController.quantityU =
                                                                          cartController.quantityU - 1;
                                                                      product.isLoadingShow = false;
                                                                      setState(() {});
                                                                    }
                                                                    print("???????????????????????");
                                                                  },
                                                                  child: Container(
                                                                      height: 23.h,
                                                                      width: 26.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(6.0),
                                                                              topLeft: Radius.circular(6.0)),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                color: Colors.grey,
                                                                                blurRadius: 4,
                                                                                spreadRadius: 0.3)
                                                                          ]),
                                                                      child: const Center(
                                                                          child: Icon(
                                                                        Icons.add,
                                                                        color: Color(0xff95006F),
                                                                      ))),
                                                                ),
                                                                Container(
                                                                  height: 23.h,
                                                                  width: 26.w,
                                                                  color: const Color(0xff95006F),
                                                                  child: Center(
                                                                      child: product.isLoadingShow ?? false
                                                                          ? Center(
                                                                              child: Padding(
                                                                              padding: EdgeInsets.symmetric(
                                                                                  horizontal: 4.0.w,
                                                                                  vertical: 4.h),
                                                                              child:
                                                                                  const CircularProgressIndicator(
                                                                                strokeWidth: 2,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ))
                                                                          : CustomText(
                                                                              text: product.updateQuantity
                                                                                  .toString(),
                                                                              fontColor: Colors.white,
                                                                            )),
                                                                ),
                                                                InkWell(
                                                                  onTap: () async {
                                                                    product.isLoadingShow = true;
                                                                    setState(() {});
                                                                    cartController.quantityU =
                                                                        cartController.quantityU - 1;
                                                                    cartController.productIdU = product.id;
                                                                    bool? isSuccess = await cartController
                                                                        .updateCartProductQuantity();
                                                                    if (isSuccess ?? true) {
                                                                      product.updateQuantity =
                                                                          (product.updateQuantity! - 1);
                                                                      product.isLoadingShow = false;
                                                                      setState(() {});
                                                                    } else {
                                                                      product.isLoadingShow = false;
                                                                      cartController.quantityU =
                                                                          cartController.quantityU + 1;
                                                                      setState(() {});
                                                                    }
                                                                    print("???????????????????????");
                                                                  },
                                                                  child: Container(
                                                                      height: 23.h,
                                                                      width: 26.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.only(
                                                                              bottomRight:
                                                                                  Radius.circular(6.0),
                                                                              bottomLeft:
                                                                                  Radius.circular(6.0)),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                color: Colors.grey,
                                                                                blurRadius: 4,
                                                                                spreadRadius: 0.3)
                                                                          ]),
                                                                      child: const Center(
                                                                          child: Icon(
                                                                        Icons.remove,
                                                                        color: Color(0xff95006F),
                                                                      ))),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          width: 100.w,
                                                          child: Align(
                                                            alignment: Alignment.topRight,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                product.isLoadingShow = true;
                                                                setState(() {});
                                                                cartController.cartItem.value.productId =
                                                                    product.id;
                                                                cartController.cartItem.value.quantity = 1;
                                                                bool? hit = await cartController.addToCart();
                                                                if (hit!) {
                                                                  product.isLoadingShow = false;
                                                                  product.isAddToCart = true;

                                                                  product.updateQuantity = 1;
                                                                  setState(() {});
                                                                } else {
                                                                  product.isLoadingShow = false;
                                                                  showSnackBar(context, 'Not Add to Cart');
                                                                }
                                                                print("guyui");
                                                              },
                                                              child: product.isLoadingShow ?? false
                                                                  ? Container(
                                                                      height: 23.h,
                                                                      width: 26.w,
                                                                      color: const Color(0xffFFFFFF),
                                                                      child: const Center(
                                                                          child: Padding(
                                                                        padding: EdgeInsets.all(4.0),
                                                                        child: CircularProgressIndicator(
                                                                          color: Color(0xff95006F),
                                                                          strokeWidth: 2,
                                                                        ),
                                                                      )),
                                                                    )
                                                                  : Container(
                                                                      height: 23.h,
                                                                      width: 26.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                color: Colors.grey,
                                                                                blurRadius: 4,
                                                                                spreadRadius: 0.3)
                                                                          ]),
                                                                      child: const Center(
                                                                          child: Icon(
                                                                        Icons.add,
                                                                        color: Color(0xff95006F),
                                                                      ))),
                                                            ),
                                                          ),
                                                        )
                                                ],
                                              );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const Center(
                                child: CustomText(
                                  text: "Rating",
                                ),
                              ),
                              const Center(
                                child: CustomText(
                                  text: "about",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
