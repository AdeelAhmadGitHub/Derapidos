import 'package:derapidos/View/Home/home_screengrocery.dart';
import 'package:derapidos/View/home_main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../consts/app_consts.dart';
import '../Explore/explore_screen.dart';
import '../Home/home_screen.dart';
import '../My Cart/mycart_screen.dart';
import '../Orders/orders_screen.dart';
import '../Profile/profile.dart';
import 'package:get/get.dart';

class NavigationbarScreenGrocery extends StatefulWidget {
  const NavigationbarScreenGrocery({Key? key}) : super(key: key);

  @override
  State<NavigationbarScreenGrocery> createState() => _NavigationbarScreenState();
}

class _NavigationbarScreenState extends State<NavigationbarScreenGrocery> {
  int _selectedIndex = 0;

  final screen = [
    const HomeScreenGrocery(),
    // const ExploreScreen(),
    // MainScreen(),
    const OrdersScreen(),
    const MycartScreen(),
    const Profile(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screen.elementAt(_selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: Container(
          height: 60.h, width: 60.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 5)]),
          // backgroundColor: AppColors().mainColor2,
          child: FloatingActionButton(
              backgroundColor: AppColors().mainColor2,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Image.asset(
                  "assets/images/d1.png",
                  height: 37.h,
                  width: 28.w,
                ),
              ),
              onPressed: () => Get.to(MainScreen())
              //     setState(() {
              //   _selectedIndex = 2;
              // }),
              ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: Padding(
          padding: const EdgeInsets.only(top: 11),
          child: BottomNavigationBar(
            elevation: 50,
            // type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            iconSize: 24,
            onTap: _onItemTapped,
            unselectedItemColor: const Color(0xff9098B1),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors().mainColor2,
            showUnselectedLabels: false,
            // backgroundColor: AppColors().mainColor2,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: "DMSans", fontSize: 8.sp),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 24,
                ),
                label: "Home",
                backgroundColor: Color(0xffFFFFFF),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.favorite_border,
              //     size: 24,
              //   ),
              //   label: "Explore",
              //   backgroundColor: Color(0xffFFFFFF),
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.favorite_border,
              //     size: 0,
              //   ),
              //   label: "",
              //   backgroundColor: Color(0xffFFFFFF),
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.analytics_outlined,
                  size: 24,
                ),
                label: "Order",
                backgroundColor: Color(0xffFFFFFF),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 24,
                ),
                label: "Cart",
                backgroundColor: Color(0xffFFFFFF),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  // Icons.person_2_outlined,
                  Icons.person,
                  size: 24,
                ),
                label: "Profile",
                backgroundColor: Color(0xffFFFFFF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
