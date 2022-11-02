import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/viewmodels/usersharedpreference_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../3.habit_screen/bottom_navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlUsername = TextEditingController();
  final _ctrlEmail = TextEditingController();
  final _ctrlPassword = TextEditingController();
  String _email = "", _password = "";
  final Map _username = {
    "nama": "",
  };
  //pembuatan variabel provider untuk mengambil data dari sharedpreferences
  late SharedPreferences sharedPreferences =
      Provider.of<UserSharedPreferenceProvider>(context, listen: false).prefs;

  //pembuatan variabel inisiasi UID Pertama
  String _userUID = "";

  @override
  void initState() {
    //fungsi initstate untuk pengaturan UID langsung pertama kali
    setState(() {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          _userUID = user.uid;
        }
      });
    });
    // memanggil fungsi initialpreference() dari provider;
    Provider.of<UserSharedPreferenceProvider>(context, listen: false)
        .getSharedPreferenceInstance();
    super.initState();
  }

  //fungsi untuk input data menuju API
  final String _baseURL =
      "https://myhabits2-flutter-default-rtdb.asia-southeast1.firebasedatabase.app";
  void postUsernameToAPI(Map user) async {
    var _dio = Dio();
    print("user UID: $_userUID");
    final response = await _dio.post("$_baseURL/users.json", data: {
      "userId": _userUID,
      "nama": user["nama"],
    });
    print("response: ${response.data}");
  }

  //fungsi dipose untuk mencegah kebocoran memori
  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    super.dispose();
  }

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
              "Belum punya akun?\nSilahkan daftar",
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
              "Nama/Username",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color.fromRGBO(53, 84, 56, 1),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _ctrlUsername,
              decoration: InputDecoration(
                hintText: "Masukkan nama/username",
                hintStyle: GoogleFonts.quicksand(
                  color: const Color.fromRGBO(53, 84, 56, 1),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _username["nama"] = value.toString();
                });
              },
              validator: (value) {
                if (_username.isEmpty) {
                  return "Mohon diisi usernamenya :)";
                }
                return null;
              },
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
                          //proses autentikasi
                          UserCredential credential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          //pemanggilan fungsi mengirimkan data username ke API
                          postUsernameToAPI(_username);
                          //pengaturan sharedpreference untuk mengubah isneedlogin true menjadi false
                          sharedPreferences.setString(
                              "username", _ctrlUsername.text);
                          sharedPreferences.setBool("isNeedLogin", false);
                          //proses navigator
                          Navigator.of(context)
                              .pushNamed(MyHabitsBottomNavigation.routeName);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Mohon maaf, password kamu masih belum aman')),
                            );
                          } else if (e.code == 'email-already-in-use') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Mohon maaf, akun ini sudah digunakan sebelumnya')),
                            );
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                    child: Text(
                      "Sign Up",
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
