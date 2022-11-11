import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../models/goodhabit_model.dart';
import '../../../../viewmodels/goodhabit_provider.dart';
import '../entrygoodhabit_screen/entrygoodhabit_screen.dart';

class GoodHabitPerItemAll extends StatefulWidget {
  final GoodHabitModel goodHabit;
  const GoodHabitPerItemAll({super.key, required this.goodHabit});

  @override
  State<GoodHabitPerItemAll> createState() => _GoodHabitPerItemAllState();
}

class _GoodHabitPerItemAllState extends State<GoodHabitPerItemAll> {
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
            ],
          ),
        ],
      ),
    );
  }
}
