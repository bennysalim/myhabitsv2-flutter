import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/goodhabit_model.dart';
import '../../../../viewmodels/goodhabit_provider.dart';
import '../entrygoodhabit_screen/entrygoodhabit_screen.dart';

class GoodHabitPerItemEachDay extends StatefulWidget {
  final GoodHabitModel goodHabit;
  const GoodHabitPerItemEachDay({super.key, required this.goodHabit});

  @override
  State<GoodHabitPerItemEachDay> createState() => _GoodHabitPerItemState();
}

class _GoodHabitPerItemState extends State<GoodHabitPerItemEachDay> {
  late bool isChecked;
  late bool isSkipped;
  final hari = DateFormat('EEEE').format(DateTime.now()).toString();
  final currentTime = DateTime.now();
  String jam = "";

  @override
  void didChangeDependencies() {
    setState(() {
      if (hari == "Monday") {
        jam = widget.goodHabit.rutinitasWaktu![0]["jam"];
      } else if (hari == "Tuesday") {
        jam = widget.goodHabit.rutinitasWaktu![1]["jam"];
      } else if (hari == "Wednesday") {
        jam = widget.goodHabit.rutinitasWaktu![2]["jam"];
      } else if (hari == "Thursday") {
        jam = widget.goodHabit.rutinitasWaktu![3]["jam"];
      } else if (hari == "Friday") {
        jam = widget.goodHabit.rutinitasWaktu![4]["jam"];
      } else if (hari == "Saturday") {
        jam = widget.goodHabit.rutinitasWaktu![5]["jam"];
      } else if (hari == "Sunday") {
        jam = widget.goodHabit.rutinitasWaktu![6]["jam"];
      }
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    setState(() {
      if (hari == "Monday") {
        isChecked = false;
        isSkipped = false;
      } else if (hari == "Tuesday") {
        isChecked = false;
        isSkipped = false;
      } else if (hari == "Wednesday") {
        isChecked = false;
        isSkipped = false;
      } else if (hari == "Thursday") {
        isChecked = false;
        isSkipped = false;
      } else if (hari == "Friday") {
        isChecked = false;
        isSkipped = false;
      } else if (hari == "Saturday") {
        isChecked = false;
        isSkipped = false;
      } else if (hari == "Sunday") {
        isChecked = false;
        isSkipped = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _onComplete() async {
      final habitCompleted = GoodHabitModel(
          namaHabit: widget.goodHabit.namaHabit,
          motivasiHabit: widget.goodHabit.motivasiHabit,
          rutinitasWaktu: widget.goodHabit.rutinitasWaktu,
          totalCompleted: widget.goodHabit.totalCompleted! + 1,
          totalSkipped: widget.goodHabit.totalSkipped);

      habitCompleted.id = widget.goodHabit.id;
      print("Completed Habit: ${widget.goodHabit.totalCompleted}");
      Provider.of<GoodHabitProvider>(context, listen: false)
          .update(habitCompleted);
    }

    Future<void> _onSkipped() async {
      final habitSkipped = GoodHabitModel(
          namaHabit: widget.goodHabit.namaHabit,
          motivasiHabit: widget.goodHabit.motivasiHabit,
          rutinitasWaktu: widget.goodHabit.rutinitasWaktu,
          totalCompleted: widget.goodHabit.totalCompleted,
          totalSkipped: widget.goodHabit.totalSkipped! + 1);
      habitSkipped.id = widget.goodHabit.id;
      Provider.of<GoodHabitProvider>(context, listen: false)
          .update(habitSkipped);
    }

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
                widget.goodHabit.namaHabit,
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
                      Navigator.of(context).pushNamed(
                          EntryGoodHabitScreen.routeName,
                          arguments: widget.goodHabit);
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
                                  "Apakah Anda yakin ingin menghapus habit dengan judul : ${widget.goodHabit.namaHabit.toString()}"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Provider.of<GoodHabitProvider>(context,
                                              listen: false)
                                          .delete(widget.goodHabit.id!);
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
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.zero,
                                bottomLeft: Radius.zero),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                                padding: const EdgeInsets.all(30),
                                width: 400,
                                height: 250,
                                child: Column(
                                  children: [
                                    Text(
                                      "Habit '${widget.goodHabit.namaHabit}' Skipped?",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color:
                                            const Color.fromRGBO(53, 84, 56, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                              onPressed: () async {
                                                await _onSkipped();
                                                setState(() {
                                                  isSkipped = !isSkipped;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Skip")),
                                        ),
                                        Expanded(
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Batal")),
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(187, 26, 26, 1),
                          ),
                          color: isSkipped
                              ? const Color.fromRGBO(187, 26, 26, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Text(
                            isSkipped ? "Skipped" : "Skip",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: isSkipped
                                  ? Colors.white
                                  : const Color.fromRGBO(187, 26, 26, 1),
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
                    widget.goodHabit.motivasiHabit,
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
                        jam,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        "${widget.goodHabit.totalCompleted}x Complete",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromRGBO(187, 26, 26, 1)),
                        padding: const EdgeInsets.all(5),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${widget.goodHabit.totalSkipped}x Skips",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: const Color.fromRGBO(187, 26, 26, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.zero,
                            bottomLeft: Radius.zero),
                      ),
                      context: context,
                      builder: (context) {
                        return Container(
                            padding: const EdgeInsets.all(30),
                            width: 400,
                            height: 250,
                            child: Column(
                              children: [
                                Text(
                                  "Habit '${widget.goodHabit.namaHabit}' Complete?",
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: const Color.fromRGBO(53, 84, 56, 1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                          onPressed: () async {
                                            await _onComplete();
                                            setState(() {
                                              isChecked = !isChecked;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Complete")),
                                    ),
                                    Expanded(
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Batal")),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: isSkipped
                            ? const Color.fromRGBO(187, 26, 26, 1)
                            : const Color.fromRGBO(53, 84, 56, 1),
                      ),
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                      backgroundColor: isChecked
                          ? const Color.fromRGBO(53, 84, 56, 1)
                          : isSkipped
                              ? const Color.fromRGBO(187, 26, 26, 1)
                              : Colors.white,
                      radius: 28,
                      child: Icon(
                        isChecked
                            ? Icons.check
                            : isSkipped
                                ? Icons.close
                                : Icons.check,
                        color: isChecked
                            ? Colors.white
                            : isSkipped
                                ? Colors.white
                                : const Color.fromRGBO(53, 84, 56, 1),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
