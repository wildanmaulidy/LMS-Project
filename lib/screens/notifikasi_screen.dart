import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildNotificationSection('Hari Ini', [
                  NotificationItem(
                    title: 'Tugas Baru Ditambahkan',
                    subtitle: 'Desain Antarmuka & Pengalaman Pengguna',
                    time: '2 jam yang lalu',
                    icon: Icons.assignment,
                    iconColor: const Color(0xFFB92B2B),
                    isUnread: true,
                  ),
                  NotificationItem(
                    title: 'Pengumuman Kelas',
                    subtitle: 'Sistem Operasi - Jadwal UTS Diperbarui',
                    time: '5 jam yang lalu',
                    icon: Icons.campaign,
                    iconColor: const Color(0xFF2563EB),
                    isUnread: true,
                  ),
                ]),
                const SizedBox(height: 24),
                _buildNotificationSection('Kemarin', [
                  NotificationItem(
                    title: 'Nilai Tugas Keluar',
                    subtitle: 'Pemrograman Perangkat Bergerak - Tugas 03',
                    time: '1 hari yang lalu',
                    icon: Icons.grade,
                    iconColor: const Color(0xFF16A34A),
                    isUnread: false,
                  ),
                  NotificationItem(
                    title: 'Kelas Dimulai',
                    subtitle: 'Bahasa Inggris: Business and Scientific',
                    time: '1 hari yang lalu',
                    icon: Icons.play_circle,
                    iconColor: const Color(0xFFF59E0B),
                    isUnread: false,
                  ),
                ]),
                const SizedBox(height: 24),
                _buildNotificationSection('Minggu Ini', [
                  NotificationItem(
                    title: 'Reminder: Deadline Tugas',
                    subtitle: 'Tugas 01 - UID Android Mobile Game',
                    time: '3 hari yang lalu',
                    icon: Icons.alarm,
                    iconColor: const Color(0xFFDC2626),
                    isUnread: false,
                  ),
                  NotificationItem(
                    title: 'Materi Baru Tersedia',
                    subtitle: 'Pemrograman Multimedia Interaktif',
                    time: '4 hari yang lalu',
                    icon: Icons.library_books,
                    iconColor: const Color(0xFF8B5CF6),
                    isUnread: false,
                  ),
                  NotificationItem(
                    title: 'Forum Diskusi',
                    subtitle: 'Kewarganegaraan - Topik baru dari dosen',
                    time: '5 hari yang lalu',
                    icon: Icons.forum,
                    iconColor: const Color(0xFF0891B2),
                    isUnread: false,
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 32),
      decoration: const BoxDecoration(
        color: Color(0xFFB92B2B),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Notifikasi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Mark all as read
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Tandai Dibaca',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSection(String title, List<NotificationItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 12),
        ...items.map((item) => _buildNotificationCard(item)),
      ],
    );
  }

  Widget _buildNotificationCard(NotificationItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.isUnread ? const Color(0xFFFEF2F2) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: item.isUnread 
              ? const Color(0xFFFECACA) 
              : const Color(0xFFF3F4F6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: item.iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              item.icon,
              color: item.iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: item.isUnread 
                              ? FontWeight.bold 
                              : FontWeight.w600,
                          color: const Color(0xFF111827),
                        ),
                      ),
                    ),
                    if (item.isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFB92B2B),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.time,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isUnread;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.isUnread,
  });
}
