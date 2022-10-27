import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bottom_navigation.dart';

class EntryGoodHabitScreen extends StatefulWidget {
  const EntryGoodHabitScreen({super.key});

  @override
  State<EntryGoodHabitScreen> createState() => _EntryGoodHabitScreenState();
}

class _EntryGoodHabitScreenState extends State<EntryGoodHabitScreen> {
  bool _btnSenin = false;
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Bangun rutinitasmu \nsekarang disini",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nama Habit",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Tambah habit disini",
                      hintStyle: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Motivasi Melakkan Habit",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Tulis motivasimu",
                      hintStyle: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pilih rutinitas",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _btnSenin = !_btnSenin;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnSenin
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Senin",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnSenin
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "08:00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Jumat",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "08:00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Selasa",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "08:00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Sabtu",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "08:00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Rabu",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "08:00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Minggu",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "08:00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Kamis",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "08:00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(53, 84, 56, 1),
                          ),
                          child: Text(
                            "Tambah Habit",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
