import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/entrygoodhabit_screen/entrygoodhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/g00dhabit_index.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/maingoodhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/badhabit_index.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/entrybadhabit_screen/entrybadhabit_screen.dart';

void main() {
  testWidgets("Tes 1 : Uji coba widget goodHabit index",
      (WidgetTester tester) async {
    //cek judul
    await tester.pumpWidget(const GoodHabitIndex());
    final title = find.text("Good Habit");
    expect(title, findsOneWidget);
    //cek tombol button +
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
  testWidgets("Tes 2 : Uji coba widget badHabit index",
      (WidgetTester tester) async {
    //cek judul
    await tester.pumpWidget(const BadHabitIndex());
    final title = find.text("Bad Habit");
    expect(title, findsOneWidget);
    //cek tombol button +
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
  testWidgets("Tes 3 : Uji coba widget entry goodHabit",
      (WidgetTester tester) async {
    await tester.pumpWidget(const EntryGoodHabitScreen());
    //find ancestor (column inside form)
    expect(find.ancestor(of: find.byType(Column), matching: find.byType(Form)),
        findsWidgets);
    //find textformfield inside column
    expect(
        find.ancestor(
            of: find.byType(TextFormField), matching: find.byType(Column)),
        findsWidgets);
  });
  testWidgets("Tes 4 : Uji coba widget entry badHabit",
      (WidgetTester tester) async {
    await tester.pumpWidget(const EntryBadHabitScreen());
    //find ancestor (column inside form)
    expect(find.ancestor(of: find.byType(Column), matching: find.byType(Form)),
        findsWidgets);
    //find textformfield inside column
    expect(
        find.ancestor(
            of: find.byType(TextFormField), matching: find.byType(Column)),
        findsWidgets);
  });
}
