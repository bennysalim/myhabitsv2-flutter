class GoodHabitModel {
  String? id;
  String namaHabit, motivasiHabit;
  List<dynamic>? rutinitasWaktu = [{}];
  int? totalCompleted;
  int? totalSkipped;

  //data yang akan diinput nantinya akan ditampung ke dalam 1 object constructor
  GoodHabitModel({
    this.id,
    required this.namaHabit,
    required this.motivasiHabit,
    required this.rutinitasWaktu,
    this.totalCompleted,
    this.totalSkipped,
  });

  factory GoodHabitModel.fromJSON(Map<String, dynamic> json) => GoodHabitModel(
        id: json["id"],
        namaHabit: json["namaHabit"],
        motivasiHabit: json["motivasiHabit"],
        rutinitasWaktu: json["rutinitasWaktu"],
        totalCompleted: json["totalCompleted"],
        totalSkipped: json['totalSkipped'],
      );

  Map<String, dynamic> toJSON() => {
        "namaHabit": namaHabit,
        "motivasiHabit": motivasiHabit,
        "rutinitasWaktu": rutinitasWaktu,
        "totalCompleted": totalCompleted,
        "totalSkipped": totalSkipped,
      };
}
