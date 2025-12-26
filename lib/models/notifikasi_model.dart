import 'package:flutter/material.dart';

enum NotifikasiType {
  tugas,
  pengumuman,
  nilai,
  jadwal,
  info,
}

class NotifikasiModel {
  final String id;
  final String judul;
  final String pesan;
  final DateTime waktu;
  final NotifikasiType type;
  final bool sudahDibaca;
  final String? relatedId;

  NotifikasiModel({
    required this.id,
    required this.judul,
    required this.pesan,
    required this.waktu,
    required this.type,
    this.sudahDibaca = false,
    this.relatedId,
  });

  NotifikasiModel copyWith({
    String? id,
    String? judul,
    String? pesan,
    DateTime? waktu,
    NotifikasiType? type,
    bool? sudahDibaca,
    String? relatedId,
  }) {
    return NotifikasiModel(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      pesan: pesan ?? this.pesan,
      waktu: waktu ?? this.waktu,
      type: type ?? this.type,
      sudahDibaca: sudahDibaca ?? this.sudahDibaca,
      relatedId: relatedId ?? this.relatedId,
    );
  }

  IconData get icon {
    switch (type) {
      case NotifikasiType.tugas:
        return Icons.assignment_rounded;
      case NotifikasiType.pengumuman:
        return Icons.campaign_rounded;
      case NotifikasiType.nilai:
        return Icons.grade_rounded;
      case NotifikasiType.jadwal:
        return Icons.calendar_today_rounded;
      case NotifikasiType.info:
        return Icons.info_rounded;
    }
  }

  Color get color {
    switch (type) {
      case NotifikasiType.tugas:
        return const Color(0xFFFF6B6B);
      case NotifikasiType.pengumuman:
        return const Color(0xFF667eea);
      case NotifikasiType.nilai:
        return const Color(0xFF4ECDC4);
      case NotifikasiType.jadwal:
        return const Color(0xFFFFD93D);
      case NotifikasiType.info:
        return const Color(0xFF6BCB77);
    }
  }

  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(waktu);

    if (diff.inMinutes < 1) {
      return 'Baru saja';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} menit lalu';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} jam lalu';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} hari lalu';
    } else {
      return '${waktu.day}/${waktu.month}/${waktu.year}';
    }
  }
}
