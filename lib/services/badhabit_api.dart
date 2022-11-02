import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhabitsv2/models/badhabit_model.dart';
import 'dart:convert';

class BadHabitAPI {
  late Dio _dio;
  String? _userUID;
  //baseURL
  static const _baseURL =
      "https://myhabits2-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/habits";

  BadHabitAPI() {
    _dio = Dio();
    getUserID();
  }

  void getUserID() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          _userUID = user.uid;
        }
      },
    );
  }

  Future<List<BadHabitModel>> getAllBadHabitFromAPI() async {
    final response = await _dio.get("$_baseURL/$_userUID/badhabits.json");
    // response.data merupakan _internallinkedhashmap<String, dynamic>
    //TYPE
    List<Map<String, dynamic>> badHabit = [];

    if (response.data != null) {
      response.data.forEach((key, value) {
        print("badhabit: $key:$value");
        badHabit.add(value);
      });
      return List<BadHabitModel>.from(badHabit
          .map((badhabit) => BadHabitModel.fromJSON(badhabit))
          .toList());
    }
    return [];
  }

  //2. post badhabit data
  Future<BadHabitModel> postBadHabitToAPI(BadHabitModel badHabit) async {
    // getUserID();
    final response = await _dio.post(
      "$_baseURL/$_userUID/badhabits.json",
      data: badHabit.toJSON(),
    );
    return badHabit;
  }
}
