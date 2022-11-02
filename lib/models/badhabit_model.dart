import 'package:flutter/material.dart';

class BadHabitModel {
  String id,
      namaHabitBuruk,
      ceritaHabitBuruk,
      motivasiHabitBuruk,
      alternatifKegiatan;
  int completed;
  int relapse;
  BadHabitModel(
      {required this.id,
      required this.namaHabitBuruk,
      required this.ceritaHabitBuruk,
      required this.motivasiHabitBuruk,
      required this.alternatifKegiatan,
      required this.completed,
      required this.relapse});

  factory BadHabitModel.fromJSON(Map<String, dynamic> json) => BadHabitModel(
        id: json["id"],
        namaHabitBuruk: json["namaHabitBuruk"],
        ceritaHabitBuruk: json["ceritaHabitBuruk"],
        motivasiHabitBuruk: json["motivasiHabitBuruk"],
        alternatifKegiatan: json["alternatifKegiatan"],
        completed: json["completed"],
        relapse: json["relapse"],
      );

  Map<String, dynamic> toJSON() => {
        "id": id,
        "namaHabitBuruk": namaHabitBuruk,
        "ceritaHabitBuruk": ceritaHabitBuruk,
        "motivasiHabitBuruk": motivasiHabitBuruk,
        "alternatifKegiatan": alternatifKegiatan,
        "completed": completed,
        "relapse": relapse,
      };
}
