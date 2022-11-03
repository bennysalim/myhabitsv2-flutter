import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../models/badhabit_model.dart';
import '../../../../viewmodels/badhabit_provider.dart';

class MainBadHabitScreen extends StatefulWidget {
  const MainBadHabitScreen({super.key});

  @override
  State<MainBadHabitScreen> createState() => _MainBadHabitScreenState();
}

class _MainBadHabitScreenState extends State<MainBadHabitScreen> {
  // String? _dateTime;

  @override
  void initState() {
    // Timer.periodic(
    //     const Duration(seconds: 1),
    //     (_) => setState(() {
    //           _dateTime = DateFormat("HH:MM:ss").format(DateTime(0));
    //           print("Datetime: ${_dateTime.toString()}");
    //         }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final badHabit = Provider.of<BadHabitProvider>(context).badHabit;
    print("BAD HABIT: ${badHabit.length}");
    return ListView.builder(
        itemCount: badHabit.length,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 20),
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
                      badHabit[index].namaHabitBuruk,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromRGBO(53, 84, 56, 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
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
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Penghapusan Bad Habit"),
                                    content: Text(
                                        "Apakah Anda yakin ingin menghapus habit dengan judul : ${badHabit[index].namaHabitBuruk.toString()}\nIngat motivasi Anda : ${badHabit[index].motivasiHabitBuruk.toString()}\nAlternatif Kegiatan: ${badHabit[index].alternatifKegiatan.toString()}"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<BadHabitProvider>(
                                                    context,
                                                    listen: false)
                                                .delete(badHabit[index].id!);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("HAPUS")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("BATAL"))
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.delete,
                              color: Color.fromRGBO(53, 84, 56, 1),
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Abstinence Time : ",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color.fromRGBO(53, 84, 56, 1),
                          ),
                        ),
                        Text(
                          "00:00:00 s",
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
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(187, 26, 26, 1),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Relapse",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(187, 26, 26, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color.fromRGBO(53, 84, 56, 1),
                          radius: 43,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Completed",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 9,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${badHabit[index].completed}d",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        CircleAvatar(
                          backgroundColor: const Color.fromRGBO(187, 26, 26, 1),
                          radius: 43,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    "Relapse",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 9,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${badHabit[index].relapse}x",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
