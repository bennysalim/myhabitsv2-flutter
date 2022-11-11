import 'package:flutter/material.dart';
import 'package:myhabitsv2/models/user_model.dart';
import 'package:myhabitsv2/services/user_api.dart';

class UserProvider with ChangeNotifier {
  late UserAPI _service;
  List<UserModel> _user = [];
  String _name = "";

  UserProvider() {
    _service = UserAPI();
    UserAPI().getUserID();
  }

  List<UserModel> get user {
    return [..._user];
  }

  String get name {
    return _name;
  }

  Future<void> getUsername() async {
    final result = await _service.getUsernameFromAPIFromUID();
    _name = result;
    notifyListeners();
  }

  Future<void> postUsername(UserModel userModel) async {
    final result = await _service.postUsernameToAPI(userModel);
    _user.add(result);
    notifyListeners();
  }
}
