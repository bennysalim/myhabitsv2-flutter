import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyBadHabitScreen extends StatelessWidget {
  const EmptyBadHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/images/onboarding_image_2.png"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Seandainya ada mesin waktu,",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            Text(
              "harusnya saya menghindari habit buruk",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            Text(
              "ini sewaktu saya masih muda.",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "tip : Tulis habit burukmu\nuntuk dihindari disini.",
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
