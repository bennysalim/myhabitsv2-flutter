import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyGoodHabitScreen extends StatelessWidget {
  const EmptyGoodHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/images/onboarding_image_3.png"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Kamu masih belum merancang habit",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            Text(
              "Yuk silahkan tambah habit barumu",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
