import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferenceProvider with ChangeNotifier {
  late SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;
  set prefs(SharedPreferences val) {
    _prefs = val;
    notifyListeners();
  }

  late bool _newUser;
  bool get newUser => _newUser;
  set newUser(bool val) {
    _newUser = val;
    notifyListeners();
  }

  void checkLogin() async {
    _prefs = await SharedPreferences.getInstance();
    _newUser = _prefs.getBool("isNeedLogin") ?? true;
  }
}
