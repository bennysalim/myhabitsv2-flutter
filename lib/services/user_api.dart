import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhabitsv2/models/user_model.dart';

class UserAPI {
  late Dio _dio;
  late String _userUID;
  void getUserID() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          _userUID = user.uid;
        }
      },
    );
  }

  UserAPI() {
    _dio = Dio();
    getUserID();
  }

  //baseURL
  final String _baseURL =
      "https://myhabits2-flutter-default-rtdb.asia-southeast1.firebasedatabase.app";

  //PART 1 : USER MANAGEMENT

  //1. post user data

  Future<Map> postUsernameToAPI(Map user) async {
    getUserID();
    final response = await _dio.post("$_baseURL/users.json", data: {
      "userID": _userUID,
      "nama": user["nama"],
    });
    print("response: ${response.data["nama"]}");
    return response.data;
  }

  //1. post user data
  Future<String> getUsernameFromAPIFromUID() async {
    final response = await _dio.get("$_baseURL/users.json");
    String userModel = "";
    if (response.data != null) {
      response.data.forEach((key, value) {
        if (value["userId"] == _userUID) {
          userModel = value["nama"];
        }
      });
      return userModel;
    }
    return "";
  }
}
