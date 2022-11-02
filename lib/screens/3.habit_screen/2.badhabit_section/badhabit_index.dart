import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/models/badhabit_model.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/badhabit_body/emptybadhabit_screen.dart';
import 'package:myhabitsv2/viewmodels/badhabit_provider.dart';
import 'package:provider/provider.dart';
import 'entrybadhabit_screen/entrybadhabit_screen.dart';
import 'badhabit_body/mainbadhabit_screen.dart';

class BadHabitIndex extends StatefulWidget {
  const BadHabitIndex({super.key});

  @override
  State<BadHabitIndex> createState() => _BadHabitIndexState();
}

class _BadHabitIndexState extends State<BadHabitIndex> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BadHabitProvider>(context, listen: false)
          .getAllBadHabitData();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final badHabit = Provider.of<BadHabitProvider>(context).badHabit;
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
      body: badHabit.isNotEmpty
          ? const MainBadHabitScreen()
          : const EmptyBadHabitScreen(),
    );
  }
}
