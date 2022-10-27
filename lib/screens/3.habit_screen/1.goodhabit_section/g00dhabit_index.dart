import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/emptygoodhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/maingoodhabit_screen.dart';

import 'entrygoodhabit_screen/entrygoodhabit_screen.dart';

class GoodHabitIndex extends StatelessWidget {
  const GoodHabitIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Habit",
          style: GoogleFonts.quicksand(
              color: const Color.fromRGBO(53, 84, 56, 1),
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15, bottom: 5, top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color.fromRGBO(53, 84, 56, 1),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EntryGoodHabitScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: MainGoodHabitScreen(),
    );
  }
}
