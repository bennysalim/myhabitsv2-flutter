import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/maingoodhabit_widget/completed_widget.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/maingoodhabit_widget/skipped_widget.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/maingoodhabit_widget/todo_widget.dart';

class MainGoodHabitScreen extends StatefulWidget {
  const MainGoodHabitScreen({super.key});

  @override
  State<MainGoodHabitScreen> createState() => _MainGoodHabitScreenState();
}

class _MainGoodHabitScreenState extends State<MainGoodHabitScreen> {
  int selectedPage = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Senin, 20 Januari 2024",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPage = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                        color: selectedPage == 1
                            ? const Color.fromRGBO(53, 84, 56, 1)
                            : Colors.white,
                      ),
                      child: Text(
                        "To-do",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: selectedPage == 1
                              ? Colors.white
                              : const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPage = 2;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                        color: selectedPage == 2
                            ? const Color.fromRGBO(53, 84, 56, 1)
                            : Colors.white,
                      ),
                      child: Text(
                        "Completed",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: selectedPage == 2
                              ? Colors.white
                              : const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPage = 3;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                        color: selectedPage == 3
                            ? const Color.fromRGBO(53, 84, 56, 1)
                            : Colors.white,
                      ),
                      child: Text(
                        "Skipped",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: selectedPage == 3
                              ? Colors.white
                              : const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              child: selectedPage == 1
                  ? const ToDoWidget()
                  : selectedPage == 2
                      ? const CompletedWidget()
                      : const SkippedWidget(),
            ),
          ],
        ));
  }
}
