import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/models/badhabit_model.dart';
import 'package:myhabitsv2/viewmodels/badhabit_provider.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';

class EntryBadHabitScreen extends StatefulWidget {
  const EntryBadHabitScreen({super.key});

  @override
  State<EntryBadHabitScreen> createState() => _EntryBadHabitScreenState();
}

class _EntryBadHabitScreenState extends State<EntryBadHabitScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController _ctrlnamaHabitBuruk = TextEditingController();
  TextEditingController _ctrlceritaHabitBuruk = TextEditingController();
  TextEditingController _ctrlmotivasiHabitBuruk = TextEditingController();
  TextEditingController _ctrlalternatifKegiatan = TextEditingController();

  String namaHabitBuruk = "",
      ceritaHabitBuruk = "",
      motivasiHabitBuruk = "",
      alternatifKegiatan = "";

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
                key: formKey,
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
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "mohon tuliskan habit buruknya";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            namaHabitBuruk = value;
                          });
                        },
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
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "ceritakan secara singkat";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            ceritaHabitBuruk = value;
                          });
                        },
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
                          hintText: "tuliskan motivasi kamu..",
                          hintStyle: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(53, 84, 56, 1),
                          ),
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "ceritakan motivasi stop habit ini";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            motivasiHabitBuruk = value;
                          });
                        },
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
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "ceritakan alteratif kegiatan";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            alternatifKegiatan = value;
                          });
                        },
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
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  final badHabit = BadHabitModel(
                                      id: nanoid(10),
                                      namaHabitBuruk: namaHabitBuruk,
                                      ceritaHabitBuruk: ceritaHabitBuruk,
                                      motivasiHabitBuruk: motivasiHabitBuruk,
                                      alternatifKegiatan: alternatifKegiatan,
                                      completed: 0,
                                      relapse: 0);
                                  Provider.of<BadHabitProvider>(context,
                                          listen: false)
                                      .add(badHabit);
                                  Navigator.of(context).pop();
                                }
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
