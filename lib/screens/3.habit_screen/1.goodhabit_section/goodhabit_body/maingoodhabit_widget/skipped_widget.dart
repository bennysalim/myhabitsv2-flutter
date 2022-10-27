import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkippedWidget extends StatelessWidget {
  const SkippedWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(187, 26, 26, 1),
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          backgroundColor: const Color.fromRGBO(187, 26, 26, 1),
                          radius: 28,
                          child: Text(
                            "Skipped",
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
