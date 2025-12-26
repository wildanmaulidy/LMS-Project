import 'package:flutter/material.dart';

class KelasModel {
  final String id;
  final String nama;
  final String kode;
  final String dosen;
  final String jadwal;
  final String ruangan;
  final int sks;
  final double progress;
  final List<Color> gradientColors;
  final IconData icon;
  final String kategori;
  final List<MateriModel> materiList;
  final List<TugasModel> tugasList;

  KelasModel({
    required this.id,
    required this.nama,
    required this.kode,
    required this.dosen,
    required this.jadwal,
    required this.ruangan,
    required this.sks,
    required this.progress,
    required this.gradientColors,
    required this.icon,
    required this.kategori,
    this.materiList = const [],
    this.tugasList = const [],
  });

  KelasModel copyWith({
    String? id,
    String? nama,
    String? kode,
    String? dosen,
    String? jadwal,
    String? ruangan,
    int? sks,
    double? progress,
    List<Color>? gradientColors,
    IconData? icon,
    String? kategori,
    List<MateriModel>? materiList,
    List<TugasModel>? tugasList,
  }) {
    return KelasModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      kode: kode ?? this.kode,
      dosen: dosen ?? this.dosen,
      jadwal: jadwal ?? this.jadwal,
      ruangan: ruangan ?? this.ruangan,
      sks: sks ?? this.sks,
      progress: progress ?? this.progress,
      gradientColors: gradientColors ?? this.gradientColors,
      icon: icon ?? this.icon,
      kategori: kategori ?? this.kategori,
      materiList: materiList ?? this.materiList,
      tugasList: tugasList ?? this.tugasList,
    );
  }
}

class MateriModel {
  final String id;
  final String judul;
  final String deskripsi;
  final String? fileUrl;
  final DateTime tanggal;
  final bool sudahDibaca;

  MateriModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    this.fileUrl,
    required this.tanggal,
    this.sudahDibaca = false,
  });

  MateriModel copyWith({
    String? id,
    String? judul,
    String? deskripsi,
    String? fileUrl,
    DateTime? tanggal,
    bool? sudahDibaca,
  }) {
    return MateriModel(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      fileUrl: fileUrl ?? this.fileUrl,
      tanggal: tanggal ?? this.tanggal,
      sudahDibaca: sudahDibaca ?? this.sudahDibaca,
    );
  }
}

class TugasModel {
  final String id;
  final String judul;
  final String deskripsi;
  final DateTime deadline;
  final bool sudahDikumpulkan;
  final double? nilai;

  TugasModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.deadline,
    this.sudahDikumpulkan = false,
    this.nilai,
  });

  TugasModel copyWith({
    String? id,
    String? judul,
    String? deskripsi,
    DateTime? deadline,
    bool? sudahDikumpulkan,
    double? nilai,
  }) {
    return TugasModel(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      deadline: deadline ?? this.deadline,
      sudahDikumpulkan: sudahDikumpulkan ?? this.sudahDikumpulkan,
      nilai: nilai ?? this.nilai,
    );
  }

  bool get isOverdue => DateTime.now().isAfter(deadline) && !sudahDikumpulkan;
}
