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
    List<BadHabitModel> badHabit = [];

    if (response.data != null) {
      response.data.forEach((key, value) {
        print("badhabit: $key:$value");
        badHabit.add(BadHabitModel(
            id: key.toString(),
            namaHabitBuruk: value["namaHabitBuruk"],
            ceritaHabitBuruk: value["ceritaHabitBuruk"],
            motivasiHabitBuruk: value["motivasiHabitBuruk"],
            alternatifKegiatan: value["alternatifKegiatan"],
            completed: value["completed"],
            relapse: value["relapse"]));
      });
      return badHabit;
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

  //4. edit bad habit data

  Future<bool> putHabitToAPI(BadHabitModel badHabit) async {
    final resp = await _dio.get("$_baseURL/$_userUID/badhabits.json");
    String keys = "";
    resp.data.forEach((key, value) {
      if (value["id"] == badHabit.id) {
        keys = key;
      }
    });
    final response = await _dio.put(
        "$_baseURL/$_userUID/badhabits/${badHabit.id}.json",
        data: badHabit.toJSON());
    return true;
  }

  Future<bool> updatePerSeconds(BadHabitModel badHabit) async {
    final resp = await _dio.get("$_baseURL/$_userUID/badhabits.json");
    String keys = "";
    resp.data.forEach((key, value) {
      if (value["id"] == badHabit.id) {
        keys = key;
      }
    });
    final response = await _dio.put(
        "$_baseURL/$_userUID/badhabits/${badHabit.id}.json",
        data: badHabit.toJSON());
    return true;
  }

  //3. delete bad habit data
  Future<bool> deleteHabitToAPI(String id) async {
    // getUserID();

    final response =
        await _dio.delete("$_baseURL/$_userUID/badhabits/$id.json");

    return true;
  }
}
