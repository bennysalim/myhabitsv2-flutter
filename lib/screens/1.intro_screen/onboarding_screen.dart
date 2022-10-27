import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/2.auth_screen/auth_index.dart';
import 'package:myhabitsv2/screens/3.habit_screen/bottom_navigation.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = "/onboarding";
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(top: 35, bottom: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "lib/images/myhabits_logo_green.png",
                    height: 40,
                    width: 140,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 600, autoPlay: true, viewportFraction: 1),
                    items: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            child: Container(
                              height: 410,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "lib/images/onboarding_image_1.png"),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Selamat Datang",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: Text(
                              "My Habits hadir dalam versi kedua melalui fitur-fitur baru penunjang manajemen habit kamu sehari-hari dengan improvement interaksi pengguna.",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: -0.4,
                                  color: const Color.fromRGBO(53, 84, 56, 1)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      //ITEM CAROUSEL 2
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            child: Container(
                              height: 410,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "lib/images/onboarding_image_3.png"),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Bangun Tujuan Hidup",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: Text(
                              "Bangun tujuan hidup kamu satu demi satu melalui habit-habit bermanfaat. Manfaatkan MyHabits sebagai reminder atas misi-misi berkualitas kamu.",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: -0.4,
                                  color: const Color.fromRGBO(53, 84, 56, 1)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      //ITEM CAROUSEL 3
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            child: Container(
                              height: 410,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "lib/images/onboarding_image_2.png"),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Stop Kebiasaan Buruk",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: Text(
                              "Kebiasaan buruk dapat menganggu produktivitas dan fokus terhadap kelancaran suksesnya perjalanan kamu menuju tujuan hidup",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: -0.4,
                                  color: const Color.fromRGBO(53, 84, 56, 1)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AuthIndex.routeName);
                        // Navigator.of(context)
                        //     .pushNamed(MyHabitsBottomNavigation.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(53, 84, 56, 1),
                          padding: const EdgeInsets.only(top: 13, bottom: 13)),
                      child: Text(
                        "Start Journey",
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
              )),
        ),
      )),
    );
  }
}
