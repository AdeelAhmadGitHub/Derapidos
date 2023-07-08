import 'dart:convert';
import 'package:derapidos/View/real_estate/chatScreen/chat_screen.dart';
import 'package:derapidos/controllers/chat_controller/chat_controller.dart';
import 'package:derapidos/models/real_estate_models/HomeModel.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/r_s_controller/home_controller.dart';

class ChatRoomLauncher {
// Chat Utils
  RSHomeController? coreProvider;
  DatabaseMethods databaseMethods = DatabaseMethods();
  var chatController = Get.put(ChatController());
  Future<UserProfile> getUserData(context, coreProvider) async {
    coreProvider = coreProvider; // context.read<CoreProvider>();
    SharedPreferences sp = await SharedPreferences.getInstance();
    var data = sp.getString('userData');
    UserProfile loginResponse = UserProfile.fromJson(jsonDecode(data.toString()));
    return loginResponse;
  }

  sendMessage(context, coreProvider) async {
    UserProfile loginResponse = await getUserData(context, coreProvider);
    var userId = 'u${loginResponse.userData?.id}';
    // var offer = coreProvider!
    //     .myQuotations!
    //     .quotations![coreProvider!.currentQuotationIndex!]
    //     .offers![coreProvider!.currentDriverOfferIndex!]; // '24';
    // int? currentQuoteIndex = coreProvider!.currentQuotationIndex!;
    // int? currentOfferIndex = coreProvider!.currentDriverOfferIndex!;
    // var quote = coreProvider!.myQuotations!.quotations![currentQuoteIndex];
    NearByListing? offer;
    RSHomeController rsHomeController = Get.put(RSHomeController());
    String? postedId;
    String? postedName;
    String? postedProfilePIc;
    String? postedPhone;
    postedId = rsHomeController.postedUserId.toString();
    postedName = rsHomeController.nPostedPersonName;
    postedProfilePIc = rsHomeController.nPostedPersonProfilePic;
    postedPhone = rsHomeController.nPostedPersonPhone;
    //

    List<String> users = [userId, postedId];

    String chatRoomId = getChatRoomId(userId, postedId);
    // 'Enter Driver here'; // 'Abbas';
    var userName = '${loginResponse.userData?.name}';
    String chatRoomName = getChatRoomId(postedName!, userName);

    Map<String, dynamic> chatRoom = {
      "roomName": "$chatRoomName",
      "users": users,
      "chatRoomId": chatRoomId,
      "driverPic": postedProfilePIc,
      "userPic": '${loginResponse.userData?.profilePic}',
      "driverPhone": postedPhone,
      "userPhone": '${loginResponse.userData?.phone}',
      "userId": '$userId',
      "driverId": '$postedId',
    };

    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChattingScreen(
          chatRoomId: chatRoomId,
          driverName: postedName, // '${userName.replaceAll(myName, "")}',
          driverPic: postedProfilePIc,
          driverPhone: postedPhone,
          driverId: '$postedId',
          userId: ('$userId'),
          userName: '$userName', // doc.get('driverPic').toString(),
        ),
      ),
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
}