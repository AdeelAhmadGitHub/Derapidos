import 'dart:convert';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  String? usermsgId = "0";
  var loading = false.obs;
  var myName = "".obs;
  var userName = "".obs;
  var myId = "".obs;
  var userId = "".obs;
  var chatRoomId = "".obs;
  var chatRoomName = "".obs;
  var email = "".obs;
  var phone = "".obs;

  Future collectUserData() async {
    // final id = FirebaseAuth.instance.currentUser!.uid;
    String? data = UserPreferences.getUserData();
    UserProfile loginResponse = UserProfile.fromJson(jsonDecode(data!));

    //
    myId.value = loginResponse.userData!.id.toString();
    myName.value = loginResponse.userData!.name!;
    email.value = loginResponse.userData!.email!;
    phone.value = loginResponse.userData!.phone!;

    print('in collectUserData >> ${myName.value} '
        '${myId.value}'
        '${myName.value} '
        '${myName.value} ');
  }
}
