import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myhabitsv2/models/goodhabit_model.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/entrygoodhabit_screen/entrygoodhabit_screen.dart';
import 'package:myhabitsv2/services/goodhabit_api.dart';
import 'package:myhabitsv2/viewmodels/goodhabit_provider.dart';
import 'package:provider/provider.dart';

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
                  return Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              goodHabit[index].namaHabit,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              EntryGoodHabitScreen()),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Color.fromRGBO(53, 84, 56, 1),
                                      size: 15,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Color.fromRGBO(53, 84, 56, 1),
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              187, 26, 26, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Skip",
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: const Color.fromRGBO(
                                                187, 26, 26, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  goodHabit[index].motivasiHabit,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: const Color.fromRGBO(53, 84, 56, 1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_clock,
                                      color: Color.fromRGBO(53, 84, 56, 1),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "20:00",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color:
                                            const Color.fromRGBO(53, 84, 56, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Color.fromRGBO(53, 84, 56, 1),
                                      ),
                                      padding: const EdgeInsets.all(5),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${goodHabit[index].totalCompleted}x Complete",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color:
                                            const Color.fromRGBO(53, 84, 56, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Color.fromRGBO(187, 26, 26, 1),
                                      ),
                                      padding: const EdgeInsets.all(5),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${goodHabit[index].totalSkipped}x Skips",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: const Color.fromRGBO(
                                            187, 26, 26, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(53, 84, 56, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(100)),
                                child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 28,
                                    child: Icon(
                                      Icons.check,
                                      color: Color.fromRGBO(53, 84, 56, 1),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
