import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../models/goodhabit_model.dart';
import '../../../../viewmodels/goodhabit_provider.dart';
import '../entrygoodhabit_screen/entrygoodhabit_screen.dart';

class GoodHabitPerItem extends StatefulWidget {
  final GoodHabitModel goodHabit;
  const GoodHabitPerItem({super.key, required this.goodHabit});

  @override
  State<GoodHabitPerItem> createState() => _GoodHabitPerItemState();
}

class _GoodHabitPerItemState extends State<GoodHabitPerItem> {
  bool isChecked = false;
  final hari = DateFormat('EEEE').format(DateTime.now()).toString();
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
  Widget build(BuildContext context) {
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(187, 26, 26, 1),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Text(
                            "Skip",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: const Color.fromRGBO(187, 26, 26, 1),
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
                          color: Color.fromRGBO(187, 26, 26, 1),
                        ),
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
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(53, 84, 56, 1),
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
  }
}
