import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myhabitsv2/main.dart';
import 'package:myhabitsv2/screens/1.intro_screen/onboarding_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/entrygoodhabit_screen/entrygoodhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/g00dhabit_index.dart';
import 'package:myhabitsv2/screens/3.habit_screen/1.goodhabit_section/goodhabit_body/maingoodhabit_screen.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/badhabit_index.dart';
import 'package:myhabitsv2/screens/3.habit_screen/2.badhabit_section/entrybadhabit_screen/entrybadhabit_screen.dart';

void main() {
  testWidgets("Tes 1 : Uji coba halaman splash screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    //cek judul
    final title = find.text("prtfliobybss");
    expect(title, findsOneWidget);
    //cek tombol button +
    expect(find.byIcon(Icons.add), findsNothing);
    //cek ancestor
    expect(
        find.ancestor(of: find.byType(SizedBox), matching: find.byType(Column)),
        findsWidgets);
  });
  testWidgets("Tes 2 : Uji coba onboarding screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OnboardingScreen()));
    //cek judul
    final title = find.text(
        "Bangun tujuan hidup kamu satu demi satu melalui habit-habit bermanfaat. Manfaatkan MyHabits sebagai reminder atas misi-misi berkualitas kamu.");
    expect(title, findsOneWidget);
  });
  testWidgets("Tes 3 : Uji coba widget entry goodHabit",
      (WidgetTester tester) async {
    await tester.pumpWidget(const EntryGoodHabitScreen());
    //find ancestor (column inside form)
    expect(find.ancestor(of: find.byType(Column), matching: find.byType(Form)),
        findsNothing);
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
