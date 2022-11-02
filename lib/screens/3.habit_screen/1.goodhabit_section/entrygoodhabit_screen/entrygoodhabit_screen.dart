import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabitsv2/models/goodhabit_model.dart';
import 'package:myhabitsv2/viewmodels/goodhabit_provider.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';

import '../../bottom_navigation.dart';

class EntryGoodHabitScreen extends StatefulWidget {
  const EntryGoodHabitScreen({super.key});

  @override
  State<EntryGoodHabitScreen> createState() => _EntryGoodHabitScreenState();
}

class _EntryGoodHabitScreenState extends State<EntryGoodHabitScreen> {
  //variabel formKey
  final formKey = GlobalKey<FormState>();
  //text editing controller
  final TextEditingController _ctrlNamaHabit = TextEditingController();
  final TextEditingController _ctrlMotivasiHabit = TextEditingController();

  //nama dan motivasi habti
  String _namaHabit = "";
  String _motivasiHabit = "";

  //days button boolean controller
  bool _btnSenin = false;
  bool _btnSelasa = false;
  bool _btnRabu = false;
  bool _btnKamis = false;
  bool _btnJumat = false;
  bool _btnSabtu = false;
  bool _btnMinggu = false;

  //hour per days controller
  String _jamSenin = "00:00";
  String _jamSelasa = "00:00";
  String _jamRabu = "00:00";
  String _jamKamis = "00:00";
  String _jamJumat = "00:00";
  String _jamSabtu = "00:00";
  String _jamMinggu = "00:00";

  //rutinitasWaktu
  List _rutinitasWaktu = [
    {"hari": "Senin", "status": false, "jam": "00:00"},
    {"hari": "Selasa", "status": false, "jam": "00:00"},
    {"hari": "Rabu", "status": false, "jam": "00:00"},
    {"hari": "Kamis", "status": false, "jam": "00:00"},
    {"hari": "Jumat", "status": false, "jam": "00:00"},
    {"hari": "Sabtu", "status": false, "jam": "00:00"},
    {"hari": "Minggu", "status": false, "jam": "00:00"},
  ];

  @override
  void initState() {
    setState(() {
      _rutinitasWaktu[0]["status"] = _btnSenin;
      _rutinitasWaktu[0]["jam"] = _jamSenin;
      _rutinitasWaktu[1]["status"] = _btnSelasa;
      _rutinitasWaktu[1]["jam"] = _jamSelasa;
      _rutinitasWaktu[2]["status"] = _btnRabu;
      _rutinitasWaktu[2]["jam"] = _jamRabu;
      _rutinitasWaktu[3]["status"] = _btnKamis;
      _rutinitasWaktu[3]["jam"] = _jamKamis;
      _rutinitasWaktu[4]["status"] = _btnJumat;
      _rutinitasWaktu[4]["jam"] = _jamJumat;
      _rutinitasWaktu[5]["status"] = _btnSabtu;
      _rutinitasWaktu[5]["jam"] = _jamSabtu;
      _rutinitasWaktu[6]["status"] = _btnMinggu;
      _rutinitasWaktu[6]["jam"] = _jamMinggu;
    });
    super.initState();
  }

  //apabila teradi update
  GoodHabitModel? updateGoodHabit;

  Future<void> _onSubmit() async {
    formKey.currentState!.save();
    final newgoodHabit = GoodHabitModel(
        id: nanoid(10),
        namaHabit: _namaHabit,
        motivasiHabit: _motivasiHabit,
        rutinitasWaktu: _rutinitasWaktu,
        totalCompleted: 0,
        totalSkipped: 0);
    print("goodHabit:$newgoodHabit");
    if (updateGoodHabit != null) {
      newgoodHabit.id = updateGoodHabit!.id;
    } else {
      Provider.of<GoodHabitProvider>(context, listen: false).add(newgoodHabit);
    }
  }

  @override
  Widget build(BuildContext context) {
    updateGoodHabit =
        ModalRoute.of(context)!.settings.arguments as GoodHabitModel?;
    if (updateGoodHabit != null) {
      _namaHabit = updateGoodHabit!.namaHabit;
      _motivasiHabit = updateGoodHabit!.motivasiHabit;
      _rutinitasWaktu = updateGoodHabit!.rutinitasWaktu!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Habit",
          style: GoogleFonts.quicksand(
              color: const Color.fromRGBO(53, 84, 56, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Bangun rutinitasmu \nsekarang disini",
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
                    "Nama Habit",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  TextFormField(
                    controller: _ctrlNamaHabit,
                    decoration: InputDecoration(
                      hintText: "Tambah habit disini",
                      hintStyle: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                      ),
                    ),
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Mohon ditulis nama habitnya";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _namaHabit = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Motivasi Melakkan Habit",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  TextFormField(
                    controller: _ctrlMotivasiHabit,
                    decoration: InputDecoration(
                      hintText: "Tulis motivasimu",
                      hintStyle: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(53, 84, 56, 1),
                      ),
                    ),
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Mohon ditulis motivasi habitnya";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _motivasiHabit = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pilih rutinitas",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromRGBO(53, 84, 56, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_btnSenin == false) {
                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  _jamSenin =
                                      "${selectedTime?.hour}:${selectedTime?.minute}";
                                  _btnSenin = !_btnSenin;
                                });
                              } else if (_btnSenin == true) {
                                setState(() {
                                  _jamSenin = "00:00";
                                  _btnSenin = !_btnSenin;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnSenin
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Senin",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnSenin
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(
                            Icons.punch_clock_rounded,
                            color: Color.fromRGBO(53, 84, 56, 1),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            _jamSenin,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_btnJumat == false) {
                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  _jamJumat =
                                      "${selectedTime?.hour}:${selectedTime?.minute}";
                                  _btnJumat = !_btnJumat;
                                });
                              } else if (_btnJumat == true) {
                                setState(() {
                                  _jamJumat = "00:00";
                                  _btnJumat = !_btnJumat;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnJumat
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Jumat",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnJumat
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            _jamJumat,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_btnSelasa == false) {
                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  _jamSelasa =
                                      "${selectedTime?.hour}:${selectedTime?.minute}";
                                  _btnSelasa = !_btnSelasa;
                                });
                              } else if (_btnSelasa == true) {
                                setState(() {
                                  _jamSelasa = "00:00";
                                  _btnSelasa = !_btnSelasa;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnSelasa
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Selasa",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnSelasa
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            _jamSelasa,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_btnSabtu == false) {
                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  _jamSabtu =
                                      "${selectedTime?.hour}:${selectedTime?.minute}";
                                  _btnSabtu = !_btnSabtu;
                                });
                              } else if (_btnSabtu == true) {
                                setState(() {
                                  _jamSabtu = "00:00";
                                  _btnSabtu = !_btnSabtu;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnSabtu
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Sabtu",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnSabtu
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            _jamSabtu,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_btnRabu == false) {
                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  _jamRabu =
                                      "${selectedTime?.hour}:${selectedTime?.minute}";
                                  _btnRabu = !_btnRabu;
                                });
                              } else if (_btnRabu == true) {
                                setState(() {
                                  _jamRabu = "00:00";
                                  _btnRabu = !_btnRabu;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnRabu
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Rabu",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnRabu
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            _jamRabu,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_btnMinggu == false) {
                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  _jamMinggu =
                                      "${selectedTime?.hour}:${selectedTime?.minute}";
                                  _btnMinggu = !_btnMinggu;
                                });
                              } else if (_btnMinggu == true) {
                                setState(() {
                                  _jamMinggu = "00:00";
                                  _btnMinggu = !_btnMinggu;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnMinggu
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Minggu",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnMinggu
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            _jamMinggu,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_btnKamis == false) {
                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  _jamKamis =
                                      "${selectedTime?.hour}:${selectedTime?.minute}";
                                  _btnKamis = !_btnKamis;
                                });
                              } else if (_btnKamis == true) {
                                setState(() {
                                  _jamKamis = "00:00";
                                  _btnKamis = !_btnKamis;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _btnKamis
                                    ? const Color.fromRGBO(53, 84, 56, 1)
                                    : Colors.white),
                            child: Text(
                              "Kamis",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: _btnKamis
                                    ? Colors.white
                                    : const Color.fromRGBO(53, 84, 56, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(Icons.punch_clock_rounded,
                              color: Color.fromRGBO(53, 84, 56, 1)),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            _jamKamis,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color.fromRGBO(53, 84, 56, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (_btnSenin == false &&
                                  _btnSelasa == false &&
                                  _btnRabu == false &&
                                  _btnKamis == false &&
                                  _btnJumat == false &&
                                  _btnSabtu == false &&
                                  _btnMinggu == false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Mohon pilih rutinitas sebelum menambah habit')),
                                );
                              } else {
                                await _onSubmit();
                                Navigator.of(context).pushNamed(
                                    MyHabitsBottomNavigation.routeName);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(53, 84, 56, 1),
                          ),
                          child: Text(
                            "Tambah Habit",
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
          ),
        ),
      ),
    );
  }
}
