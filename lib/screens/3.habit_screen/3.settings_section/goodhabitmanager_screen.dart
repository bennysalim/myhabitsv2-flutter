import 'package:flutter/material.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/goodhabit_peritemall.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/goodhabit_provider.dart';

class GoodHabitManagerScreen extends StatefulWidget {
  const GoodHabitManagerScreen({super.key});

  @override
  State<GoodHabitManagerScreen> createState() => _GoodHabitManagerScreenState();
}

class _GoodHabitManagerScreenState extends State<GoodHabitManagerScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GoodHabitProvider>(context, listen: false)
          .getAllGoodHabitData();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final goodHabit = Provider.of<GoodHabitProvider>(context).goodHabit;
    return Scaffold(
      appBar: AppBar(title: const Text("Good Habit Data")),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: ListView.builder(
            itemCount: goodHabit.length,
            itemBuilder: (context, index) {
              return GoodHabitPerItemAll(goodHabit: goodHabit[index]);
            },
          )),
    );
  }
}
