import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/badhabit_body/badhabit_peritem.dart';
import 'package:provider/provider.dart';

import '../../../../models/badhabit_model.dart';
import '../../../../viewmodels/badhabit_provider.dart';

class MainBadHabitScreen extends StatefulWidget {
  const MainBadHabitScreen({super.key});

  @override
  State<MainBadHabitScreen> createState() => _MainBadHabitScreenState();
}

class _MainBadHabitScreenState extends State<MainBadHabitScreen> {
  @override
  Widget build(BuildContext context) {
    final badHabit = Provider.of<BadHabitProvider>(context).badHabit;
    print("BAD HABIT: ${badHabit.length}");
    return ListView.builder(
        itemCount: badHabit.length,
        itemBuilder: (context, index) {
          return BadHabitPerItem(badHabit: badHabit[index]);
        });
  }
}
