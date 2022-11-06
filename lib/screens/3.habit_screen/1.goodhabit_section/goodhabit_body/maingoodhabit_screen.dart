import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/goodhabit_peritemall.dart';
import 'package:myhabitsv2/viewmodels/goodhabit_provider.dart';
import 'package:provider/provider.dart';

import 'goodhabit_peritemeachday.dart';

class MainGoodHabitScreen extends StatefulWidget {
  const MainGoodHabitScreen({super.key});

  @override
  State<MainGoodHabitScreen> createState() => _MainGoodHabitScreenState();
}

class _MainGoodHabitScreenState extends State<MainGoodHabitScreen> {
  final hari = DateFormat('EEEE').format(DateTime.now()).toString();
  var hariIni =
      "${DateFormat('EEEE').format(DateTime.now()).toString()}, ${DateFormat.yMMMd().format(DateTime.now()).toString()}";
  int selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    final goodHabit = Provider.of<GoodHabitProvider>(context).goodHabit;
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
              height: 13,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Expanded(
            //       child: InkWell(
            //         onTap: () {
            //           setState(() {
            //             selectedPage = 1;
            //           });
            //         },
            //         child: Container(
            //           padding: const EdgeInsets.all(6),
            //           decoration: BoxDecoration(
            //             border: Border.all(
            //               color: const Color.fromRGBO(53, 84, 56, 1),
            //             ),
            //             color: selectedPage == 1
            //                 ? const Color.fromRGBO(53, 84, 56, 1)
            //                 : Colors.white,
            //           ),
            //           child: Text(
            //             "Habit Hari Ini",
            //             textAlign: TextAlign.center,
            //             style: GoogleFonts.quicksand(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 11,
            //               color: selectedPage == 1
            //                   ? Colors.white
            //                   : const Color.fromRGBO(53, 84, 56, 1),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: InkWell(
            //         onTap: () {
            //           setState(() {
            //             selectedPage = 2;
            //           });
            //         },
            //         child: Container(
            //           padding: const EdgeInsets.all(6),
            //           decoration: BoxDecoration(
            //             border: Border.all(
            //               color: const Color.fromRGBO(53, 84, 56, 1),
            //             ),
            //             color: selectedPage == 2
            //                 ? const Color.fromRGBO(53, 84, 56, 1)
            //                 : Colors.white,
            //           ),
            //           child: Text(
            //             "Manage Data Habit",
            //             textAlign: TextAlign.center,
            //             style: GoogleFonts.quicksand(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 11,
            //               color: selectedPage == 2
            //                   ? Colors.white
            //                   : const Color.fromRGBO(53, 84, 56, 1),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: goodHabit.length,
              itemBuilder: (context, index) {
                return GoodHabitPerItemEachDay(goodHabit: goodHabit[index]);
              },
            ))
          ],
        ));
  }
}
