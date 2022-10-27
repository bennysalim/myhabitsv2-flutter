import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/2.auth_screen/auth_index.dart';
import 'myhabitsinfo_screen.dart';

class SettingsIndex extends StatelessWidget {
  const SettingsIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.quicksand(
              color: const Color.fromRGBO(53, 84, 56, 1),
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 18, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Akun",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Divider(
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  Text(
                    "Benny Septiawan Salim",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "benny.septiawan@student.umn.ac.id",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AuthIndex.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                    child: Text(
                      "Log Out",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: -0.4,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "About",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Divider(
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyHabitsInfoScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      dense: true,
                      contentPadding:
                          const EdgeInsets.only(left: 0.0, right: 0.0),
                      leading: Text(
                        "MyHabits Info",
                        style: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(53, 84, 56, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Color.fromRGBO(53, 84, 56, 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
