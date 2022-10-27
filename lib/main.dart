import 'package:flutter/material.dart';
import 'package:myhabitsv2/screens/1.intro_screen/onboarding_screen.dart';
import 'package:myhabitsv2/screens/2.auth_screen/auth_index.dart';
import 'package:myhabitsv2/screens/3.habit_screen/bottom_navigation.dart';
import 'package:myhabitsv2/screens/1.intro_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // colorSchemeSeed: const Color.fromRGBO(53, 84, 56, 1),
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          OnboardingScreen.routeName: (context) => const OnboardingScreen(),
          AuthIndex.routeName: (context) => const AuthIndex(),
          MyHabitsBottomNavigation.routeName: (context) =>
              const MyHabitsBottomNavigation(),
        });
  }
}
