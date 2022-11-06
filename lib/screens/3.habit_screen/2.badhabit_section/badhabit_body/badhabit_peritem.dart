import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/models/badhabit_model.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/entrybadhabit_screen/entrybadhabit_screen.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodels/badhabit_provider.dart';

class BadHabitPerItem extends StatefulWidget {
  final BadHabitModel badHabit;
  const BadHabitPerItem({super.key, required this.badHabit});

  @override
  State<BadHabitPerItem> createState() => _BadHabitPerItemState();
}

class _BadHabitPerItemState extends State<BadHabitPerItem> {
  Future<void> _onComplete() async {
    if (widget.badHabit != null) {
      final abstinenceTime = BadHabitModel(
          namaHabitBuruk: widget.badHabit.namaHabitBuruk,
          ceritaHabitBuruk: widget.badHabit.ceritaHabitBuruk,
          motivasiHabitBuruk: widget.badHabit.motivasiHabitBuruk,
          alternatifKegiatan: widget.badHabit.alternatifKegiatan,
          completed: widget.badHabit.completed! + 1,
          relapse: widget.badHabit.relapse);

      abstinenceTime.id = widget.badHabit.id;
      Provider.of<BadHabitProvider>(context, listen: false)
          .update(abstinenceTime);
    }
  }

  Future<void> _onRelapse() async {
    final relapse = BadHabitModel(
        namaHabitBuruk: widget.badHabit.namaHabitBuruk,
        ceritaHabitBuruk: widget.badHabit.ceritaHabitBuruk,
        motivasiHabitBuruk: widget.badHabit.motivasiHabitBuruk,
        alternatifKegiatan: widget.badHabit.alternatifKegiatan,
        completed: 0,
        relapse: widget.badHabit.relapse! + 1);
    relapse.id = widget.badHabit.id;
    Provider.of<BadHabitProvider>(context, listen: false).update(relapse);
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _onComplete();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 20),
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
                widget.badHabit.namaHabitBuruk,
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
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          EntryBadHabitScreen.routeName,
                          arguments: widget.badHabit);
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
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Penghapusan Habit"),
                              content: Text(
                                  "Apakah Anda yakin ingin menghapus habit dengan judul : ${widget.badHabit.namaHabitBuruk.toString()}"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Provider.of<BadHabitProvider>(context,
                                              listen: false)
                                          .delete(widget.badHabit.id!);
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
                  Text(
                    "Abstinence Time: ${widget.badHabit.completed} seconds",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  Text(
                    "Relapse: ${widget.badHabit.relapse}x",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: const Color.fromRGBO(187, 26, 26, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Yakin mau relapse?"),
                                  content: Text(
                                      "Cerita : ${widget.badHabit.ceritaHabitBuruk} \n\nMotivasi : ${widget.badHabit.motivasiHabitBuruk}\n\nAlternatif Kegiatan : ${widget.badHabit.alternatifKegiatan}"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Masih bisa survive!"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await _onRelapse();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Ulang dari 0"),
                                    ),
                                  ],
                                );
                              });
                        },
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
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Saya mau stop ini"),
                                  content: Text(
                                      "Cerita : ${widget.badHabit.ceritaHabitBuruk} \n\nMotivasi : ${widget.badHabit.motivasiHabitBuruk}\n\nAlternatif Kegiatan : ${widget.badHabit.alternatifKegiatan}"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Keluar"))
                                  ],
                                );
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Motivate Me",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
