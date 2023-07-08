import 'package:flutter/material.dart';
import '../user_prefs/user_prefs.dart';

class PrefsProvider with ChangeNotifier {
  UserPreferences userPreferences = UserPreferences();
  bool _loginStatus = false;
  String _userData = '';
  String _userPasword = '';

  bool get getloginStatus => _loginStatus;
  String get getUserData => _userData;
  String get getUserPassword => _userPasword;

  set setUserData(String data) {
    _userData = data;
    UserPreferences.setUserData(data);
    notifyListeners();
  }
}
