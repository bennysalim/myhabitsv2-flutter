import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoWidget extends StatefulWidget {
  const ToDoWidget({super.key});

  @override
  State<ToDoWidget> createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
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
                      "Martial Arts",
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
                                color: const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Senin, Selasa, Rabu",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: const Color.fromRGBO(53, 84, 56, 1),
                          ),
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
                              "27x Completed",
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
                              "0x Skipped",
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
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 28,
                            child: Icon(
                              Icons.check,
                              color: const Color.fromRGBO(53, 84, 56, 1),
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
    );
  }
}
