import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
    List<GoodHabitModel> goodHabit = [];

    if (response.data != null) {
      response.data.forEach((key, value) {
        print("keymap: $key:$value");
        goodHabit.add(GoodHabitModel(
            id: key.toString(),
            namaHabit: value["namaHabit"].toString(),
            motivasiHabit: value["motivasiHabit"].toString(),
            rutinitasWaktu: value["rutinitasWaktu"].toList(),
            totalCompleted: value["totalCompleted"],
            totalSkipped: value["totalSkipped"]));
      });
      return goodHabit;
    }
    return [];
  }

  Future<List<GoodHabitModel>> getGoodHabitFromAPIPerDay() async {
    final hari = DateFormat('EEEE').format(DateTime.now()).toString();
    final response = await _dio.get("$_baseURL/$_userUID/goodhabits.json");
    // response.data merupakan _internallinkedhashmap<String, dynamic>
    //TYPE
    List<GoodHabitModel> goodHabit = [];
    if (response.data != null) {
      response.data.forEach((key, value) {
        print("keymap: $key:$value");
        if (hari == "Monday") {
          if (value["rutinitasWaktu"][0]["hari"] == "Minggu" &&
              value["rutinitasWaktu"][0]["status"] == true) {
            goodHabit.add(GoodHabitModel(
                id: key.toString(),
                namaHabit: value["namaHabit"].toString(),
                motivasiHabit: value["motivasiHabit"].toString(),
                rutinitasWaktu: value["rutinitasWaktu"].toList(),
                totalCompleted: value["totalCompleted"],
                totalSkipped: value["totalSkipped"]));
          }
        } else if (hari == "Tuesday") {
          if (value["rutinitasWaktu"][1]["hari"] == "Selasa" &&
              value["rutinitasWaktu"][1]["status"] == true) {
            goodHabit.add(GoodHabitModel(
                id: key.toString(),
                namaHabit: value["namaHabit"].toString(),
                motivasiHabit: value["motivasiHabit"].toString(),
                rutinitasWaktu: value["rutinitasWaktu"].toList(),
                totalCompleted: value["totalCompleted"],
                totalSkipped: value["totalSkipped"]));
          }
        } else if (hari == "Wednesday") {
          if (value["rutinitasWaktu"][2]["hari"] == "Rabu" &&
              value["rutinitasWaktu"][2]["status"] == true) {
            goodHabit.add(GoodHabitModel(
                id: key.toString(),
                namaHabit: value["namaHabit"].toString(),
                motivasiHabit: value["motivasiHabit"].toString(),
                rutinitasWaktu: value["rutinitasWaktu"].toList(),
                totalCompleted: value["totalCompleted"],
                totalSkipped: value["totalSkipped"]));
          }
        } else if (hari == "Thursday") {
          if (value["rutinitasWaktu"][3]["hari"] == "Kamis" &&
              value["rutinitasWaktu"][3]["status"] == true) {
            goodHabit.add(GoodHabitModel(
                id: key.toString(),
                namaHabit: value["namaHabit"].toString(),
                motivasiHabit: value["motivasiHabit"].toString(),
                rutinitasWaktu: value["rutinitasWaktu"].toList(),
                totalCompleted: value["totalCompleted"],
                totalSkipped: value["totalSkipped"]));
          }
        } else if (hari == "Friday") {
          if (value["rutinitasWaktu"][4]["hari"] == "Jumat" &&
              value["rutinitasWaktu"][4]["status"] == true) {
            goodHabit.add(GoodHabitModel(
                id: key.toString(),
                namaHabit: value["namaHabit"].toString(),
                motivasiHabit: value["motivasiHabit"].toString(),
                rutinitasWaktu: value["rutinitasWaktu"].toList(),
                totalCompleted: value["totalCompleted"],
                totalSkipped: value["totalSkipped"]));
          }
        } else if (hari == "Saturday") {
          if (value["rutinitasWaktu"][5]["hari"] == "Sabtu" &&
              value["rutinitasWaktu"][5]["status"] == true) {
            goodHabit.add(GoodHabitModel(
                id: key.toString(),
                namaHabit: value["namaHabit"].toString(),
                motivasiHabit: value["motivasiHabit"].toString(),
                rutinitasWaktu: value["rutinitasWaktu"].toList(),
                totalCompleted: value["totalCompleted"],
                totalSkipped: value["totalSkipped"]));
          }
        } else if (hari == "Sunday") {
          if (value["rutinitasWaktu"][6]["hari"] == "Minggu" &&
              value["rutinitasWaktu"][6]["status"] == true) {
            goodHabit.add(GoodHabitModel(
                id: key.toString(),
                namaHabit: value["namaHabit"].toString(),
                motivasiHabit: value["motivasiHabit"].toString(),
                rutinitasWaktu: value["rutinitasWaktu"].toList(),
                totalCompleted: value["totalCompleted"],
                totalSkipped: value["totalSkipped"]));
          }
        }
      });
      return goodHabit;
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
        "$_baseURL/$_userUID/goodhabits/${goodHabit.id}.json",
        data: goodHabit.toJSON());
    return true;
  }

  Future<bool> deleteHabitToAPI(String id) async {
    // getUserID();

    final response =
        await _dio.delete("$_baseURL/$_userUID/goodhabits/$id.json");
    return true;
  }
}
