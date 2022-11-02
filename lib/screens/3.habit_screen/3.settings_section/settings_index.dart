import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/2.auth_screen/auth_index.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../viewmodels/usersharedpreference_provider.dart';
import 'myhabitsinfo_screen.dart';

class SettingsIndex extends StatefulWidget {
  const SettingsIndex({super.key});

  @override
  State<SettingsIndex> createState() => _SettingsIndexState();
}

class _SettingsIndexState extends State<SettingsIndex> {
  var _email = "Email: ";
  var _nama = "";
  //pembuatan variabel provider untuk mengambil data dari sharedpreferences
  late SharedPreferences sharedPreferences =
      Provider.of<UserSharedPreferenceProvider>(context, listen: false).prefs;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _email = "Email: ${user.email}";
        });
      }
    });
    Provider.of<UserSharedPreferenceProvider>(context, listen: false)
        .getSharedPreferenceInstance();
    super.initState();
  }

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
                    _nama,
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _email,
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context)
                          .pushReplacementNamed(AuthIndex.routeName);
                      sharedPreferences.remove("username");
                      sharedPreferences.setBool("isNeedLogin", true);
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
