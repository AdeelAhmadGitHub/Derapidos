import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _keyAccessToken = 'authToken';
  static const _keyderapidostype = '_keyderapidostype';
  static const _keyAuthCheck = 'authCheck';
  static const _keyLanguageCheck = 'languageCheck';
  static const _keyUserId = 'UserId';
  static const _keySource = 'Source';
  static const _keyDestination = 'destination';
  static const _keyCid = 'cid';
  static const String favList = 'favorite_list';
  static const String _keyUserData = 'userData';

  static Future init() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  static Future setAccessToken(String? s) async {
    await _preferences!.setString(_keyAccessToken, s!);
  }

  static Future setSource(String? s) async {
    await _preferences!.setString(_keySource, s!);
  }

  static Future setDestination(String? s) async {
    await _preferences!.setString(_keyDestination, s!);
  }

  static Future setCid(String? s) async {
    await _preferences!.setString(_keyCid, s!);
  }

  static Future setUseId(String? s) async {
    await _preferences!.setString(_keyUserId, s!);
  }

  static String? getAccessToken() {
    return _preferences!.getString(_keyAccessToken);
  }
  static String? getDerapidosType() {
    return _preferences!.getString(_keyderapidostype);
  }
  static Future setLoginCheck(bool? check) async {
    await _preferences!.setBool(_keyAuthCheck, check!);
  }

  static bool? getLoginCheck() {
    return _preferences!.getBool(_keyAuthCheck);
  }

  static Future setLanguageCheck(bool? check) async {
    await _preferences!.setBool(_keyLanguageCheck, check!);
  }

  static bool? getLanguageCheck() {
    return _preferences!.getBool(_keyLanguageCheck);
  }

  static Future setUserData(String? string) async {
    await _preferences!.setString(_keyUserData, string!);
  }

  static String? getUserData() {
    return _preferences!.getString(_keyUserData);
  }

  static String? getUserId() {
    return _preferences!.getString(_keyUserId);
  }

  static String? getSource() {
    return _preferences!.getString(_keySource);
  }

  static String? getDestination() {
    return _preferences!.getString(_keyDestination);
  }

  static String? getCid() {
    return _preferences!.getString(_keyCid);
  }

  static clearAllData() {
    _preferences!.clear();
  }

  ///
  static Future<bool> saveFavoriteList(List<String>? favoriteList) async {
    return await _preferences!.setStringList(favList, favoriteList!);
  }

  static List<String>? retrieveFavoriteList() {
    return _preferences!.getStringList(favList);
  }

  static Future<bool> removeFavoriteList() {
    return _preferences!.remove(favList);
  }
}
