import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/models/user_model.dart';
import 'package:myhabitsv2/viewmodels/user_provider.dart';
import 'package:provider/provider.dart';

class MyHabitsInfoScreen extends StatefulWidget {
  const MyHabitsInfoScreen({super.key});

  @override
  State<MyHabitsInfoScreen> createState() => _MyHabitsInfoScreenState();
}

class _MyHabitsInfoScreenState extends State<MyHabitsInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/images/myhabits_logo_green.png",
                width: 225,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "this project is created using flutter",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Developers Overview",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const Divider(
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                "prtfliobybss",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Developer : Benny Septiawan Salim",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "created in : 2022",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "App Credits",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const Divider(
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                "UI Component & Icons : MaterialApp",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Logo Designed by : Ricky T (Designed in 2021)",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Illustrations : PixelTrue from Figma",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
