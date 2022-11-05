import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myhabitsv2/viewmodels/goodhabit_provider.dart';
import 'package:provider/provider.dart';

import 'goodhabit_peritem.dart';

class MainGoodHabitScreen extends StatefulWidget {
  const MainGoodHabitScreen({super.key});

  @override
  State<MainGoodHabitScreen> createState() => _MainGoodHabitScreenState();
}

class _MainGoodHabitScreenState extends State<MainGoodHabitScreen> {
  final hari = DateFormat('EEEE').format(DateTime.now()).toString();
  var hariIni =
      "${DateFormat('EEEE').format(DateTime.now()).toString()}, ${DateFormat.yMMMd().format(DateTime.now()).toString()}";
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final goodHabit = Provider.of<GoodHabitProvider>(context).goodHabit;
    print("LENGTH : ${goodHabit.length}");
    // print(contoh);
    return Container(
        padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              hariIni,
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Habit hari ini",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: goodHabit.length,
                itemBuilder: (context, index) {
                  return GoodHabitPerItem(goodHabit: goodHabit[index]);
                },
              ),
            ),
          ],
        ));
  }
}
