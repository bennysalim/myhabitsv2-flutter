import 'dart:async';

import 'package:flutter/material.dart';

class BadHabitModel {
  String? id;
  String namaHabitBuruk,
      ceritaHabitBuruk,
      motivasiHabitBuruk,
      alternatifKegiatan;
  int? completed;
  int? relapse;
  BadHabitModel(
      {this.id,
      required this.namaHabitBuruk,
      required this.ceritaHabitBuruk,
      required this.motivasiHabitBuruk,
      required this.alternatifKegiatan,
      this.completed,
      this.relapse});

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
        "namaHabitBuruk": namaHabitBuruk,
        "ceritaHabitBuruk": ceritaHabitBuruk,
        "motivasiHabitBuruk": motivasiHabitBuruk,
        "alternatifKegiatan": alternatifKegiatan,
        "completed": completed,
        "relapse": relapse,
      };
}
