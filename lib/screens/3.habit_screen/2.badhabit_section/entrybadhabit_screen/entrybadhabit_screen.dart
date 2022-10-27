import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryBadHabitScreen extends StatefulWidget {
  const EntryBadHabitScreen({super.key});

  @override
  State<EntryBadHabitScreen> createState() => _EntryBadHabitScreenState();
}

class _EntryBadHabitScreenState extends State<EntryBadHabitScreen> {
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
                        "“Saya ingin stop habit buruk, \nmohon MyHabits dukungannya”",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tulis Habit Burukmu",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "stop merokok...",
                          hintStyle: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(53, 84, 56, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Cerita singkat habitmu seperti apa?",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "saya kecanduan...",
                          hintStyle: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(53, 84, 56, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Kenapa kamu harus stop habit ini?",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "karena saya...",
                          hintStyle: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(53, 84, 56, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Alternatif kegiatan (agar tetap termotivasi)",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "saya mau melakukan...",
                          hintStyle: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(53, 84, 56, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 220,
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
                    ]),
              ),
            ),
          ),
        ));
  }
}
