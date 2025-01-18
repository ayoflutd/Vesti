import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vesti/common/constant/storage_constant.dart';
import 'package:vesti/model/user.dart';

class StorageService{

  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  String? getString(String key){
    return  _preferences.getString(key)??"";
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences.setInt(key, value);
  }

  int? getInt(String key){
    return  _preferences.getInt(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    return _preferences.getBool(key) != null? true : false;
  }

  bool isFistOpen(){
    return _preferences.getBool(AppStorage.APP_FIRST_TIME)??false;
  }

  bool isLoggedIn(){
    return _preferences.getBool(AppStorage.APP_ISLOGGED_IN)??false;
  }

  String userAccessToken (){
    return _preferences.getString(AppStorage.USER_ACCESS_TOKEN)??"";
  }

  User loadProfile(){
    final data = _preferences.getString(AppStorage.USER_PROFILE);
    return User.fromJson(jsonDecode(data!));
  }

  User updateProfile(){
    final data = _preferences.getString(AppStorage.USER_PROFILE);
    return User.fromJson(jsonDecode(data!));
  }

}