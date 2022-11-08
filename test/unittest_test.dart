import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myhabitsv2/firebase_options.dart';
import 'package:myhabitsv2/models/badhabit_model.dart';
import 'package:myhabitsv2/models/goodhabit_model.dart';
import 'package:myhabitsv2/services/badhabit_api.dart';
import 'package:myhabitsv2/services/goodhabit_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'unittest_test.mocks.dart';

@GenerateMocks([GoodHabitAPI])
@GenerateMocks([BadHabitAPI])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  group("Melakukan berbagai tes API", () {
    GoodHabitAPI goodHabitAPI = MockGoodHabitAPI();
    BadHabitAPI badHabitAPI = MockBadHabitAPI();
    test("tes get goodhabit data dari API", () async {
      when(goodHabitAPI.getAllGoodHabitFromAPI())
          .thenAnswer((_) async => <GoodHabitModel>[
                GoodHabitModel(
                    namaHabit: "membaca",
                    motivasiHabit: "ingin pandai",
                    rutinitasWaktu: [
                      {"hari": "Senin", "jam": "08:00", "status": false}
                    ])
              ]);
      var goodHabit = await GoodHabitAPI().getGoodHabitFromAPIPerDay();
      expect(goodHabit.isNotEmpty, true);
    });
    test("tes get bad habit data dari API", () async {
      when(badHabitAPI.getAllBadHabitFromAPI())
          .thenAnswer((_) async => <BadHabitModel>[
                BadHabitModel(
                    namaHabitBuruk: "stop sosmed",
                    ceritaHabitBuruk: "saya menghabiskan waktu bermain sosmed",
                    motivasiHabitBuruk: "ingin meningkatkan produktivitas",
                    alternatifKegiatan: "coding")
              ]);
      var badHabit = await BadHabitAPI().getAllBadHabitFromAPI();
      expect(badHabit.isNotEmpty, true);
    });
  });
}
