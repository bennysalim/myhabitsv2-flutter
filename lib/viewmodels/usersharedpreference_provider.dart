import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferenceProvider with ChangeNotifier {
  late SharedPreferences _prefs;
  set prefs(SharedPreferences val) {
    _prefs = val;
    notifyListeners();
  }

  SharedPreferences get prefs => _prefs;

  late bool _newUser;
  set newUser(bool val) {
    _newUser = val;
    notifyListeners();
  }

  bool get newUser => _newUser;

  void getSharedPreferenceInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  void checkLogin() async {
    prefs = await SharedPreferences.getInstance();
    newUser = prefs.getBool("isNeedLogin") ?? true;
  }
}
