import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myhabitsv2/models/goodhabit_model.dart';

class GoodHabitItem extends StatefulWidget {
  final GoodHabitModel goodHabit;
  const GoodHabitItem({super.key, required this.goodHabit});

  @override
  State<GoodHabitItem> createState() => _GoodHabitItemState();
}

class _GoodHabitItemState extends State<GoodHabitItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
