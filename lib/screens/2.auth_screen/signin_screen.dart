import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/screens/3.habit_screen/bottom_navigation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlEmail = TextEditingController();
  final _ctrlPassword = TextEditingController();
  String _email = "", _password = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Sudah punya akun?\nSilahkan masuk",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _ctrlEmail,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: GoogleFonts.quicksand(
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.toString();
                });
              },
              validator: (value) {
                if (_email.isEmpty) {
                  return "Mohon diisi email yang valid!";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: _ctrlPassword,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.quicksand(
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _password = value.toString();
                });
              },
              validator: (value) {
                if (_password.isNotEmpty && _password.length < 6) {
                  return "Password minimal 6 huruf";
                } else if (_password.isEmpty) {
                  return "Mohon diisi password yang valid!";
                }
                return null;
              },
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          UserCredential credential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                                  email: _email, password: _password);
                          Navigator.of(context)
                              .pushNamed(MyHabitsBottomNavigation.routeName);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Mohon maaf, user ini belum ditemukan, silahkan sign up terlebih dahulu')),
                            );
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Mohon maaf, password kamu salah'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                    child: Text(
                      "Sign In",
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
            ),
          ],
        ),
      ),
    );
  }
}
