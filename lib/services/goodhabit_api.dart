import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhabitsv2/models/goodhabit_model.dart';
import 'dart:convert';

class GoodHabitAPI {
  late Dio _dio;
  String? _userUID;
  //baseURL
  static const _baseURL =
      "https://myhabits2-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/habits";

  GoodHabitAPI() {
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

  Future<List<GoodHabitModel>> getAllGoodHabitFromAPI() async {
    final response = await _dio.get("$_baseURL/$_userUID/goodhabits.json");
    // response.data merupakan _internallinkedhashmap<String, dynamic>
    //TYPE
    List<Map<String, dynamic>> goodHabit = [];

    if (response.data != null) {
      response.data.forEach((key, value) {
        print("keymap: $key:$value");
        goodHabit.add(value);
      });
      return List<GoodHabitModel>.from(
          goodHabit.map((habit) => GoodHabitModel.fromJSON(habit)).toList());
    }
    return [];
  }

  //2. post good habit data
  Future<GoodHabitModel> postGoodHabitToAPI(GoodHabitModel goodHabit) async {
    // getUserID();
    final response = await _dio.post(
      "$_baseURL/$_userUID/goodhabits.json",
      data: goodHabit.toJSON(),
    );
    if (response.data > 0) {
      response.data.forEach((key, value) {
        final goodHabitID = value["id"];
        goodHabit.id = goodHabitID;
      });
    }
    return goodHabit;
  }

  //3. edit good habit data
  Future<bool> editGoodHabitToAPI(GoodHabitModel goodHabit) async {
    final resp = await _dio.get("$_baseURL/$_userUID/goodhabits.json");
    String keys = "";
    resp.data.forEach((key, value) {
      if (value["id"] == goodHabit.id) {
        keys = key;
      }
    });

    final response = await _dio.put(
        "$_baseURL/$_userUID/goodhabits/$keys/${goodHabit.id}.json",
        data: goodHabit.toJSON());
    if (response.data > 0) {
      return true;
    }
    return false;
  }

  Future<bool> deleteHabitToAPI(String id) async {
    // getUserID();

    final response = await _dio.delete("$_baseURL/$_userUID/goodhabits/$id");
    if (response.data['goodhabits']['affectedRows'] > 0) {
      return true;
    }
    return false;
  }
}
