import 'package:flutter/material.dart';
import '../models/kelas_model.dart';
import '../models/notifikasi_model.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  // Dummy data for classes
  List<KelasModel> _kelasList = [];
  List<NotifikasiModel> _notifikasiList = [];

  List<KelasModel> get kelasList => _kelasList;
  List<NotifikasiModel> get notifikasiList => _notifikasiList;

  int get unreadNotificationCount =>
      _notifikasiList.where((n) => !n.sudahDibaca).length;

  void initializeData() {
    _initializeKelas();
    _initializeNotifikasi();
  }

  void _initializeKelas() {
    _kelasList = [
      KelasModel(
        id: '1',
        nama: 'Pemrograman Mobile',
        kode: 'IF401',
        dosen: 'Dr. Ahmad Fauzi, M.Kom',
        jadwal: 'Senin, 08:00 - 10:30',
        ruangan: 'Lab Komputer 3',
        sks: 3,
        progress: 0.75,
        gradientColors: const [Color(0xFF667eea), Color(0xFF764ba2)],
        icon: Icons.phone_android_rounded,
        kategori: 'Pemrograman',
        materiList: [
          MateriModel(
            id: 'm1',
            judul: 'Pengenalan Flutter',
            deskripsi: 'Dasar-dasar framework Flutter untuk mobile development',
            tanggal: DateTime.now().subtract(const Duration(days: 14)),
            sudahDibaca: true,
          ),
          MateriModel(
            id: 'm2',
            judul: 'Widget & Layout',
            deskripsi: 'Memahami widget tree dan layout system di Flutter',
            tanggal: DateTime.now().subtract(const Duration(days: 7)),
            sudahDibaca: true,
          ),
          MateriModel(
            id: 'm3',
            judul: 'State Management',
            deskripsi: 'Mengelola state aplikasi dengan Provider dan setState',
            tanggal: DateTime.now().subtract(const Duration(days: 1)),
            sudahDibaca: false,
          ),
        ],
        tugasList: [
          TugasModel(
            id: 't1',
            judul: 'UI/UX Login Screen',
            deskripsi: 'Membuat tampilan login screen yang menarik',
            deadline: DateTime.now().add(const Duration(days: 3)),
            sudahDikumpulkan: false,
          ),
          TugasModel(
            id: 't2',
            judul: 'CRUD Sederhana',
            deskripsi: 'Implementasi CRUD dengan local storage',
            deadline: DateTime.now().add(const Duration(days: 7)),
            sudahDikumpulkan: false,
          ),
        ],
      ),
      KelasModel(
        id: '2',
        nama: 'Basis Data Lanjutan',
        kode: 'IF402',
        dosen: 'Prof. Siti Nurhaliza, Ph.D',
        jadwal: 'Selasa, 13:00 - 15:30',
        ruangan: 'Ruang 204',
        sks: 3,
        progress: 0.60,
        gradientColors: const [Color(0xFF11998e), Color(0xFF38ef7d)],
        icon: Icons.storage_rounded,
        kategori: 'Database',
        materiList: [
          MateriModel(
            id: 'm4',
            judul: 'Normalisasi Database',
            deskripsi: 'Teknik normalisasi database hingga 3NF',
            tanggal: DateTime.now().subtract(const Duration(days: 10)),
            sudahDibaca: true,
          ),
        ],
        tugasList: [
          TugasModel(
            id: 't3',
            judul: 'ERD E-Commerce',
            deskripsi: 'Merancang ERD untuk sistem e-commerce',
            deadline: DateTime.now().add(const Duration(days: 5)),
            sudahDikumpulkan: false,
          ),
        ],
      ),
      KelasModel(
        id: '3',
        nama: 'Kecerdasan Buatan',
        kode: 'IF403',
        dosen: 'Dr. Budi Santoso, M.T',
        jadwal: 'Rabu, 08:00 - 10:30',
        ruangan: 'Lab AI',
        sks: 3,
        progress: 0.45,
        gradientColors: const [Color(0xFFf093fb), Color(0xFFf5576c)],
        icon: Icons.psychology_rounded,
        kategori: 'AI/ML',
        materiList: [],
        tugasList: [],
      ),
      KelasModel(
        id: '4',
        nama: 'Jaringan Komputer',
        kode: 'IF404',
        dosen: 'Ir. Dewi Lestari, M.Sc',
        jadwal: 'Kamis, 10:00 - 12:30',
        ruangan: 'Lab Jaringan',
        sks: 3,
        progress: 0.80,
        gradientColors: const [Color(0xFF4facfe), Color(0xFF00f2fe)],
        icon: Icons.lan_rounded,
        kategori: 'Jaringan',
        materiList: [],
        tugasList: [],
      ),
      KelasModel(
        id: '5',
        nama: 'Keamanan Sistem',
        kode: 'IF405',
        dosen: 'Dr. Hadi Wijaya, M.Kom',
        jadwal: 'Jumat, 13:00 - 15:30',
        ruangan: 'Ruang 301',
        sks: 3,
        progress: 0.55,
        gradientColors: const [Color(0xFFfa709a), Color(0xFFfee140)],
        icon: Icons.security_rounded,
        kategori: 'Security',
        materiList: [],
        tugasList: [],
      ),
    ];
  }

  void _initializeNotifikasi() {
    _notifikasiList = [
      NotifikasiModel(
        id: 'n1',
        judul: 'Tugas Baru: UI/UX Login',
        pesan: 'Tugas baru telah ditambahkan untuk mata kuliah Pemrograman Mobile. Deadline: 3 hari lagi.',
        waktu: DateTime.now().subtract(const Duration(minutes: 30)),
        type: NotifikasiType.tugas,
        sudahDibaca: false,
        relatedId: '1',
      ),
      NotifikasiModel(
        id: 'n2',
        judul: 'Pengumuman Perubahan Jadwal',
        pesan: 'Kelas Basis Data Lanjutan minggu depan dipindah ke hari Rabu jam 10:00.',
        waktu: DateTime.now().subtract(const Duration(hours: 2)),
        type: NotifikasiType.pengumuman,
        sudahDibaca: false,
      ),
      NotifikasiModel(
        id: 'n3',
        judul: 'Nilai Tugas Telah Keluar',
        pesan: 'Nilai tugas "Normalisasi Database" telah dipublikasikan. Lihat hasilnya sekarang.',
        waktu: DateTime.now().subtract(const Duration(hours: 5)),
        type: NotifikasiType.nilai,
        sudahDibaca: true,
      ),
      NotifikasiModel(
        id: 'n4',
        judul: 'Reminder: Deadline Besok',
        pesan: 'Jangan lupa kumpulkan tugas ERD E-Commerce sebelum besok pukul 23:59.',
        waktu: DateTime.now().subtract(const Duration(days: 1)),
        type: NotifikasiType.tugas,
        sudahDibaca: true,
      ),
      NotifikasiModel(
        id: 'n5',
        judul: 'Jadwal UTS Telah Dirilis',
        pesan: 'Jadwal Ujian Tengah Semester telah dipublikasikan. Silakan cek di portal akademik.',
        waktu: DateTime.now().subtract(const Duration(days: 2)),
        type: NotifikasiType.jadwal,
        sudahDibaca: true,
      ),
      NotifikasiModel(
        id: 'n6',
        judul: 'Selamat Bergabung!',
        pesan: 'Selamat datang di LMS Student Portal. Semoga sukses dalam perkuliahan!',
        waktu: DateTime.now().subtract(const Duration(days: 7)),
        type: NotifikasiType.info,
        sudahDibaca: true,
      ),
    ];
  }

  // Notification methods
  void markNotificationAsRead(String id) {
    final index = _notifikasiList.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifikasiList[index] = _notifikasiList[index].copyWith(sudahDibaca: true);
    }
  }

  void markAllNotificationsAsRead() {
    _notifikasiList = _notifikasiList
        .map((n) => n.copyWith(sudahDibaca: true))
        .toList();
  }

  void deleteNotification(String id) {
    _notifikasiList.removeWhere((n) => n.id == id);
  }

  void clearAllNotifications() {
    _notifikasiList.clear();
  }

  // Kelas methods
  KelasModel? getKelasById(String id) {
    try {
      return _kelasList.firstWhere((k) => k.id == id);
    } catch (e) {
      return null;
    }
  }

  List<KelasModel> getKelasByKategori(String kategori) {
    if (kategori == 'Semua') return _kelasList;
    return _kelasList.where((k) => k.kategori == kategori).toList();
  }

  List<String> get kategoriList {
    final categories = _kelasList.map((k) => k.kategori).toSet().toList();
    return ['Semua', ...categories];
  }

  // Stats
  int get totalKelas => _kelasList.length;
  
  int get totalTugas => _kelasList.fold(0, (sum, k) => sum + k.tugasList.length);
  
  int get tugasBelumSelesai => _kelasList.fold(
    0,
    (sum, k) => sum + k.tugasList.where((t) => !t.sudahDikumpulkan).length,
  );

  double get averageProgress {
    if (_kelasList.isEmpty) return 0;
    return _kelasList.fold(0.0, (sum, k) => sum + k.progress) / _kelasList.length;
  }
}
