import 'dart:convert';
import 'package:derapidos/View/Login/login_screen.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derapidos/View/Custom%20Widget/custom_text.dart';
import 'package:derapidos/View/real_estate/chatScreen/chat_screen.dart';
import 'package:derapidos/consts/app_consts.dart';
import 'package:derapidos/controllers/chat_controller/chat_controller.dart';
import 'package:derapidos/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../component/custom_card.dart';
import '../../../models/user_profile.dart';
import '../../../services/prefs_provider.dart';
import '../../../user_prefs/user_prefs.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  static const String id = "MessageScreen";

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var chatController = Get.put(ChatController());
  String? usermsgType;
  String? usermsgRole;
  Stream? chatRooms;
  UserProfile? userProfile;
  Map<String, dynamic>? userData;
  gotcallf() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      //log('datansdlaslasljlajlaajlaJLas');
      Get.to(LoginScreen());
    } else {
      chatController.collectUserData();

      String? data = UserPreferences.getUserData();
      if (data != null) {
        userProfile = UserProfile.fromJson(jsonDecode(data));
        usermsgType = "0";
        if (usermsgType == "0") {
          usermsgRole = userProfile!.userData!.id.toString();
          print("this is userrole $usermsgRole");
        }
      } else {}

      // getUserInfogetChats();
      getUserInfogetChats();
    }
  }
  @override
  initState() {
    gotcallf();


    super.initState();
  }

  // getUserInfogetChats() async {
  //   userData = jsonDecode(Provider.of<PrefsProvider>(context, listen: false).getUserData);
  //   // await chatController.collectUserData(context);
  //   print('chatController.myId.value= d${userData!['driver_id']}');
  //   // Constants.myName = await HelperFunctions.getUserNameSharedPreference();
  //   DatabaseMethods().getUserChats('d${userData!['driver_id']}').then((snapshots) {
  //     // myid in place of Constants.myName!
  //     setState(() {
  //       chatRooms = snapshots;
  //       print("we got the data + ${chatRooms.toString()} this is name/myId  d${userData!['driver_id']}");
  //       // myid in place of Constants.myName!
  //     });
  //   });
  // }
  getUserInfogetChats() async {
    await chatController.collectUserData();
    print('chatController.myId.value= ${chatController.myId.value}');
    // Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    DatabaseMethods().getUserChats(usermsgRole!).then((snapshots) {
      // myid in place of Constants.myName!
      setState(() {
        chatRooms = snapshots;
        print("we got the data + ${chatRooms.toString()} this is name/myId  ${chatController.myId.value}");
        // myid in place of Constants.myName!
      });
    });
  }

  int tabTextIndexSelected = 0;

  final listTextTabToggle = ["Seller", "Buyer"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors().mainColor2,
        title: CustomText(
          text: "Message",
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
            child: FlutterToggleTab(
              width: 20,
              // height: 11,
              selectedIndex: tabTextIndexSelected,
              selectedBackgroundColors: [
                AppColors().mainColor2,
                Colors.white,
              ],
              selectedTextStyle: TextStyle(color: Colors.white, fontSize: 12..sp),
              unSelectedBackgroundColors: const [Colors.white],
              unSelectedTextStyle: TextStyle(color: Colors.black, fontSize: 12..sp),
              labels: listTextTabToggle,
              selectedLabelIndex: (index) {
                setState(() {
                  tabTextIndexSelected = index;
                  usermsgType = tabTextIndexSelected.toString();
                  if (usermsgType == "0") {
                    usermsgRole = userProfile!.userData!.id.toString();
                    chatController.usermsgId = usermsgRole;
                    getUserInfogetChats();

                    print("this is userrole $usermsgRole");
                  } else if (usermsgType == "1") {
                    usermsgRole = "u${userProfile!.userData!.id.toString()}";
                    getUserInfogetChats();

                    print("this is userrole $usermsgRole");
                  }
                  print("tabTextIndexSelected>>>>>>>>>>>>>>>$usermsgType");
                });
              },
              isScroll: false,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
                stream: chatRooms,
                builder: (context, AsyncSnapshot snapshot) {
                  print('{snapshot.data}  >>>>   >>>>   ${snapshot.data}');
                  if (snapshot.hasData) {
                    QuerySnapshot? querySnapshot = snapshot.data;
                    print('{docs length}  >>>>   >>>>   ${querySnapshot!.docs.length}');

                    return Expanded(
                      child: ListView.builder(
                        // itemCount: 15,
                        itemCount: querySnapshot.docs.length, // _menuItem.length,

                        itemBuilder: (BuildContext context, index) {
                          var doc = querySnapshot.docs[index];
                          print('${doc.data()}');
                          // var dateTime =
                          //     DateTime.parse('${doc.get('lastMessageTime')}');
                          String myName = chatController.myName.value; //.split(' ').first;
                          print('myname $myName');
                          String userName = doc.get('roomName').toString().replaceAll("_", "");
                          print('userName $userName');

                          // var dateTime = DateTime.fromMillisecondsSinceEpoch(
                          //     doc.get('time'));

                          return Column(
                            children: [
                              SizedBox(height: 5.h),
                              InkWell(
                                onTap: () {
                                  if (usermsgType == "0") {
                                    usermsgRole = userProfile!.userData!.id.toString();
                                    chatController.usermsgId = usermsgRole;
                                    getUserInfogetChats();

                                    print("this is userrole $usermsgRole");
                                  } else if (usermsgType == "1") {
                                    usermsgRole = "u${userProfile!.userData!.id.toString()}";
                                    getUserInfogetChats();

                                    print("this is userrole $usermsgRole");
                                  }
                                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChattingScreen(
                                      chatRoomId: doc.get('chatRoomId').toString(),
                                      driverName: '${userName.replaceAll(myName, "")}',
                                      driverPic: doc.get('driverPic').toString(),
                                      driverPhone: doc.get('driverPhone').toString(),
                                      driverId: doc.get('driverId'),
                                      userId: doc.get('userId'),
                                      userName: myName,
                                    ),
                                  ),
                                );},
                                child: Container(
                                  height: 80.h,
                                  // width: 375.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0.5.sp,
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20.sp,
                                          // backgroundImage: AssetImage('assets/images/dr.png'),
                                          backgroundImage: NetworkImage(doc.get('driverPic')),
                                        ),
                                        SizedBox(width: 20.w),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              // width: 120,
                                              child: CustomText(
                                                text: userName.replaceAll(myName, ""),
                                                // "Fahad Ishfaq",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            // CustomText(
                                            //   text: "Online",
                                            //   fontSize: 12.sp,
                                            //   fontWeight: FontWeight.w400,
                                            //   fontColor: Color(0xff6BDA97),
                                            // ),
                                          ],
                                        ),
                                        SizedBox(width: 120.w),
                                        // Image.asset(
                                        //   "assets/images/chat1.png",
                                        //   height: 20.h,
                                        //   width: 20.w,
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }

  String timeAgo(DateTime fatchedDate) {
    DateTime currentDate = DateTime.now();

    var different = currentDate.difference(fatchedDate);

    if (different.inDays > 365) {
      return "${(different.inDays / 365).floor()} ${(different.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (different.inDays > 30) {
      return "${(different.inDays / 30).floor()} ${(different.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (different.inDays > 7) {
      return "${(different.inDays / 7).floor()} ${(different.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (different.inDays > 0) {
      return "${different.inDays} ${different.inDays == 1 ? "day" : "days"} ago";
    }
    if (different.inHours > 0) {
      return "${different.inHours} ${different.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (different.inMinutes > 0) {
      return "${different.inMinutes} ${different.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    if (different.inMinutes == 0) return 'Just Now';

    return fatchedDate.toString();
  }
}
