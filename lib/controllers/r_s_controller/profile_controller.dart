import 'dart:convert';

import 'package:get/get.dart';

import '../../models/user_profile.dart';
import '../../services/api_services.dart';
import '../../user_prefs/user_prefs.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyProfile();
  }

  var rsProfileLoading = false;
  var rsEditProfileLoading = false.obs;
  UserProfile? userProfile;
  UserData? userData = UserData();

  Future getMyProfile() async {
    rsProfileLoading = true;
    await getProfile();
    rsProfileLoading = false;
    update();
  }

  getProfile() {
    rsProfileLoading = true;
    var data = UserPreferences.getUserData();
    if (data != null) {
      userProfile = UserProfile.fromJson(jsonDecode(data));
      userData!.name = userProfile!.userData!.name ?? "";
      userData!.email = userProfile!.userData!.email ?? "";
      userData!.phone = userProfile!.userData!.phone ?? "";
      // userData!.profilePic = userProfile!.userData!.profilePic ?? "";
      rsProfileLoading = false;
    } else {
      rsProfileLoading = true;
      //userProfile = UserProfile.fromJson(jsonDecode(data!));
      userData!.name = userProfile?.userData?.name ?? "";
      userData!.email = userProfile?.userData?.email ?? "";
      userData!.phone = userProfile?.userData?.phone ?? "";
      // userData!.email = userProfile!.userData!.email;
      rsProfileLoading = false;
    }
    update();
  }

  editProfile() async {
    var res = await ApiServices().editProfile(userData!);
    return res;
  }

  Future rsEditProfile(String? image, String? name, String? email, String? phone, String? password) async {
    var res = await ApiServices().rsEditProfile(image, name, email, phone, password, userData).then((value) {
      print(userProfile!.message);
      print("api done $name");
      return true;
    }).onError((error, stackTrace) {
      print("object");
      return false;
    });
    print(res);
    return res;
  }
}
