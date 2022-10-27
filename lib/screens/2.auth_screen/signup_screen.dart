import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../3.habit_screen/bottom_navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Belum punya akun?\nSilahkan daftar",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Username",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: GoogleFonts.quicksand(
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: GoogleFonts.quicksand(
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.quicksand(
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(MyHabitsBottomNavigation.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                    child: Text(
                      "Sign Up",
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
          ],
        ),
      ),
    );
  }
}
