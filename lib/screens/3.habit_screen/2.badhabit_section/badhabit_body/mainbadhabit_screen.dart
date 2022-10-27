import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainBadHabitScreen extends StatefulWidget {
  const MainBadHabitScreen({super.key});

  @override
  State<MainBadHabitScreen> createState() => _MainBadHabitScreenState();
}

class _MainBadHabitScreenState extends State<MainBadHabitScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Senin, 20 Januari 2024",
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: const Color.fromRGBO(53, 84, 56, 1),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "I Commit to quit : ",
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: const Color.fromRGBO(53, 84, 56, 1),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
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
                    "Stop Sosmed",
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
                        "365d 10h 33m 37s",
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
                                    "365d",
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
                                  "27x",
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
        ),
      ],
    );
  }
}
