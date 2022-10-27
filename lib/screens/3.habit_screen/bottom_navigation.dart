import 'package:flutter/material.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/g00dhabit_index.dart';

import '2.badhabit_section/badhabit_index.dart';
import '3.settings_section/settings_index.dart';

class MyHabitsBottomNavigation extends StatefulWidget {
  static const routeName = "./onboarding/authindex/bottomnav";
  const MyHabitsBottomNavigation({super.key});

  @override
  State<MyHabitsBottomNavigation> createState() =>
      _MyHabitsBottomNavigationState();
}

class _MyHabitsBottomNavigationState extends State<MyHabitsBottomNavigation> {
  int _bottomNavSelectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    GoodHabitIndex(),
    BadHabitIndex(),
    SettingsIndex()
  ];

  //fungsi apabila tombol nav diclick
  void _onBottomNavClick(int index) {
    setState(() {
      _bottomNavSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: "Good Habit"),
          BottomNavigationBarItem(
              icon: Icon(Icons.smoking_rooms_rounded),
              activeIcon: Icon(Icons.smoking_rooms_rounded),
              label: "Bad Habit"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings_rounded),
              label: "Settings"),
        ],
        currentIndex: _bottomNavSelectedIndex,
        onTap: _onBottomNavClick,
        selectedItemColor: const Color.fromRGBO(53, 84, 56, 1),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_bottomNavSelectedIndex),
      ),
    );
  }
}
