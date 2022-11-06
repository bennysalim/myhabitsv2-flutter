import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/emptygoodhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/maingoodhabit_screen.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/goodhabit_provider.dart';
import 'entrygoodhabit_screen/entrygoodhabit_screen.dart';

class GoodHabitIndex extends StatefulWidget {
  const GoodHabitIndex({super.key});

  @override
  State<GoodHabitIndex> createState() => _GoodHabitIndexState();
}

class _GoodHabitIndexState extends State<GoodHabitIndex> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GoodHabitProvider>(context, listen: false)
          .getAllGoodHabitDataPerDay();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final goodHabit = Provider.of<GoodHabitProvider>(context).goodHabit;
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
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const EntryGoodHabitScreen();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween =
                            Tween(begin: const Offset(1, 0), end: Offset.zero);
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            )
          ],
        ),
        body: goodHabit.isNotEmpty
            ? const MainGoodHabitScreen()
            : const EmptyGoodHabitScreen());
  }
}
