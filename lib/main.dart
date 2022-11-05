import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhabitsv2/screens/1.intro_screen/onboarding_screen.dart';
import 'package:myhabitsv2/screens/2.auth_screen/auth_index.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/entrygoodhabit_screen/entrygoodhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/entrybadhabit_screen/entrybadhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/bottom_navigation.dart';
import 'package:myhabitsv2/screens/1.intro_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myhabitsv2/viewmodels/badhabit_provider.dart';
import 'package:myhabitsv2/viewmodels/goodhabit_provider.dart';
import 'package:myhabitsv2/viewmodels/usersharedpreference_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserSharedPreferenceProvider()),
        ChangeNotifierProvider(create: (_) => GoodHabitProvider()),
        ChangeNotifierProvider(create: (_) => BadHabitProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          OnboardingScreen.routeName: (context) => const OnboardingScreen(),
          AuthIndex.routeName: (context) => const AuthIndex(),
          MyHabitsBottomNavigation.routeName: (context) =>
              const MyHabitsBottomNavigation(),
          EntryGoodHabitScreen.routeName: (context) =>
              const EntryGoodHabitScreen(),
          EntryBadHabitScreen.routeName: (context) =>
              const EntryBadHabitScreen(),
        },
      ),
    );
  }
}
