import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'entrybadhabit_screen/entrybadhabit_screen.dart';
import 'badhabit_body/mainbadhabit_screen.dart';

class BadHabitIndex extends StatelessWidget {
  const BadHabitIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quit Habit",
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
                    builder: (context) => const EntryBadHabitScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: MainBadHabitScreen(),
    );
  }
}
