import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/1.intro_screen/onboarding_screen.dart';
import 'package:myhabitsv2/screens/2.auth_screen/signin_screen.dart';
import 'package:myhabitsv2/screens/2.auth_screen/signup_screen.dart';

class AuthIndex extends StatefulWidget {
  static const routeName = "/onboarding/authindex";
  const AuthIndex({super.key});

  @override
  State<AuthIndex> createState() => _AuthIndexState();
}

class _AuthIndexState extends State<AuthIndex> {
  int selectedPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In/Sign Up",
          style: GoogleFonts.quicksand(
              color: const Color.fromRGBO(53, 84, 56, 1),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(OnboardingScreen.routeName);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(53, 84, 56, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedPage = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                        color: selectedPage == 1
                            ? const Color.fromRGBO(53, 84, 56, 1)
                            : Colors.white,
                      ),
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: selectedPage == 1
                              ? Colors.white
                              : const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedPage = 2;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(53, 84, 56, 1),
                        ),
                        color: selectedPage == 2
                            ? const Color.fromRGBO(53, 84, 56, 1)
                            : Colors.white,
                      ),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: selectedPage == 2
                              ? Colors.white
                              : const Color.fromRGBO(53, 84, 56, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                child: selectedPage == 1
                    ? const SignInScreen()
                    : const SignUpScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
