import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:myhabitsv2/screens/1.intro_screen/onboarding_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/bottom_navigation.dart';
import 'package:myhabitsv2/viewmodels/usersharedpreference_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  late bool isNeedLogin;

  void checkLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isNeedLogin = sharedPreferences.getBool("isNeedLogin") ?? true;
    print("isNeedLogin: ${isNeedLogin}");
    if (isNeedLogin == false) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHabitsBottomNavigation(),
          ),
        ),
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    // Provider.of<UserSharedPreferenceProvider>(context, listen: false)
    //     .checkLogin();
    // setState(() {
    //   isNeedLogin = Provider.of<UserSharedPreferenceProvider>(context).newUser;
    // });
    checkLogin();
    // print("isNeedLogin: ${isNeedLogin.toString()}");
    // if (isNeedLogin == true) {
    //   Timer(
    //     const Duration(seconds: 2),
    //     () => Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const OnboardingScreen(),
    //       ),
    //     ),
    //   );
    // } else {
    //   Timer(
    //     const Duration(seconds: 2),
    //     () => Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const MyHabitsBottomNavigation(),
    //       ),
    //     ),
    //   );
    // }

    //TANPA MENGGUNAKAN SHAREDPREFERENCES
    // Timer(
    //   const Duration(seconds: 2),
    //   () => Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const OnboardingScreen(),
    //     ),
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(90, 70, 90, 70),
          child: Stack(
            children: [
              Center(child: Image.asset('lib/images/myhabits_logo_green.png')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Center(child: Image.asset('lib/images/myhabits_logo_green.png')),
                  Center(
                    child: Text(
                      "dirancang dan dibangun oleh",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: const Color.fromRGBO(53, 84, 56, 1)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Center(
                    child: Text(
                      "prtfliobybss",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromRGBO(53, 84, 56, 1)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
