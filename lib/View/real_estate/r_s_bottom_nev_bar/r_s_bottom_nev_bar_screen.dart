import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/real_estate/chatScreen/message_screen.dart';
import 'package:derapidos/component/custom_card.dart';
import 'package:derapidos/controllers/r_s_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../../consts/app_consts.dart';
import '../../home_main/main_screen.dart';
import '../account/account_screen.dart';
import '../add_property/add_property_screen.dart';
import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';

class RSBottomNevBar extends StatefulWidget {
  const RSBottomNevBar({super.key});

  @override
  _RSBottomNevBarState createState() => _RSBottomNevBarState();
}

class _RSBottomNevBarState extends State<RSBottomNevBar> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool expanded = false;
  int _currentIndex = 0;
  List<IconData>? icons;
  ValueChanged<int>? onIconTapped;
  final List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    _pages.add(RSHomeScreen());
    _pages.add(
        // MessageScree()
        MessageScreen());
    _pages.add(AddPropertyScreen());
    _pages.add(FavouriteScreen());
    _pages.add(AccountScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.transparent,
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20..r),
          topRight: Radius.circular(20..r),
        ),
        child: BottomAppBar(
          elevation: 900,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0..r,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            height: 50.h,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 10.sp,
                unselectedFontSize: 10.sp,
                iconSize: 20.r,
                // elevation: 1000,
                currentIndex: _currentIndex,
                backgroundColor: Colors.white,
                // fixedColor: Colors.amber,
                selectedItemColor: AppColors().mainColor2,
                unselectedLabelStyle:
                    TextStyle(color: _currentIndex == 2 ? AppColors().mainColor2 : AppColors().mainColor2),
                selectedLabelStyle:
                    TextStyle(color: _currentIndex == 2 ? AppColors().mainColor2 : AppColors().mainColor2),
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 16.r,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/images/m.png",
                          color: _currentIndex == 1 ? AppColors().mainColor2 : AppColors().lightBlack),
                      label: 'Message'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: '\nSell/Rent'),
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/images/short.png",
                          color: _currentIndex == 3 ? AppColors().mainColor2 : AppColors().lightBlack),
                      label: 'Shortlist'),
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/images/account.png",
                          color: _currentIndex == 4 ? AppColors().mainColor2 : AppColors().lightBlack),
                      label: 'Account')
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SpeedDial(
        backgroundColor: AppColors().mainColor2,
        childrenButtonSize: Size(100, 170),
        // childMargin: EdgeInsets.all(10),
        animatedIcon: AnimatedIcons.add_event,
        children: [
          SpeedDialChild(
              labelWidget: CustomCard(
                cardColor: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black38),
                cardChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: "Go to Home", fontSize: 20.sp),
                ),
              ),
              onTap: () => Get.to(() => MainScreen())),
          SpeedDialChild(
              labelWidget: CustomCard(
                cardColor: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black38),
                cardChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: "Add Property", fontSize: 20.sp),
                ),
              ),
              onTap: () {
                Get.to(() => AddPropertyScreen());
                // setState(() {
                //   _currentIndex = 2;
                // });
              }),
        ],
      ),
      // Container(
      //   height: 55..h,
      //   width: 55..w,
      //   decoration: BoxDecoration(
      //     color: AppColors().mainColor2,
      //     shape: BoxShape.circle,
      //     border: Border.all(color: AppColors().mainColor2, width: 1, style: BorderStyle.solid),
      //   ),
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.white,
      //     child: Icon(
      //       Icons.add,
      //       color: Colors.black,
      //     ),
      //     onPressed: () => setState(() {
      //       _currentIndex = 2;
      //     }),
      //   ),
      // ),
    );
  }
}
