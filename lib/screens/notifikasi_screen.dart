import 'package:flutter/material.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          _buildBackgroundDecorations(),
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                  children: [
                    _buildNotificationSection('Hari Ini', [
                      NotificationItem(
                        title: 'Tugas Baru Ditambahkan',
                        subtitle: 'Desain Antarmuka & Pengalaman Pengguna',
                        time: '2 jam lalu',
                        icon: Icons.assignment_rounded,
                        color: const Color(0xFF667eea),
                        isUnread: true,
                      ),
                      NotificationItem(
                        title: 'Pengumuman Kelas',
                        subtitle: 'Sistem Operasi - Jadwal UTS Diperbarui',
                        time: '5 jam lalu',
                        icon: Icons.campaign_rounded,
                        color: const Color(0xFF764ba2),
                        isUnread: true,
                      ),
                    ]),
                    const SizedBox(height: 24),
                    _buildNotificationSection('Kemarin', [
                      NotificationItem(
                        title: 'Nilai Tugas Keluar',
                        subtitle: 'Pemrograman Mobile - Tugas 03',
                        time: '1 hari lalu',
                        icon: Icons.grading_rounded,
                        color: const Color(0xFF00C9A7),
                        isUnread: false,
                      ),
                      NotificationItem(
                        title: 'Kelas Dimulai',
                        subtitle: 'Bahasa Inggris: Business',
                        time: '1 hari lalu',
                        icon: Icons.play_circle_rounded,
                        color: const Color(0xFFFFA726),
                        isUnread: false,
                      ),
                    ]),
                    const SizedBox(height: 24),
                    _buildNotificationSection('Minggu Ini', [
                      NotificationItem(
                        title: 'Reminder: Deadline Tugas',
                        subtitle: 'Tugas 01 - UID Android Mobile Game',
                        time: '3 hari lalu',
                        icon: Icons.alarm_rounded,
                        color: const Color(0xFFFF6B6B),
                        isUnread: false,
                      ),
                      NotificationItem(
                        title: 'Materi Baru Tersedia',
                        subtitle: 'Pemrograman Multimedia Interaktif',
                        time: '4 hari lalu',
                        icon: Icons.library_books_rounded,
                        color: const Color(0xFF5C6BC0),
                        isUnread: false,
                      ),
                      NotificationItem(
                        title: 'Forum Diskusi',
                        subtitle: 'Kewarganegaraan - Topik baru dari dosen',
                        time: '5 hari lalu',
                        icon: Icons.forum_rounded,
                        color: const Color(0xFFEC407A),
                        isUnread: false,
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Stack(
      children: [
        Positioned(
          top: -80,
          left: -60,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF764ba2).withValues(alpha: 0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF667eea),
            Color(0xFF764ba2),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF667eea).withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Notifikasi',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
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
            fontWeight: FontWeight.w700,
            color: Color(0xFF1a1a2e),
          ),
        ),
        const SizedBox(height: 12),
        ...items.asMap().entries.map((entry) => 
          _buildNotificationCard(entry.value, entry.key)
        ),
      ],
    );
  }

  Widget _buildNotificationCard(NotificationItem item, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400 + (index * 80)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 15 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: item.isUnread 
              ? Colors.white 
              : Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(18),
          border: item.isUnread
              ? Border.all(
                  color: item.color.withValues(alpha: 0.3),
                  width: 1.5,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: item.isUnread
                  ? item.color.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(18),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          item.color,
                          item.color.withValues(alpha: 0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: item.color.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      item.icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
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
                                      ? FontWeight.w700 
                                      : FontWeight.w600,
                                  color: const Color(0xFF1a1a2e),
                                ),
                              ),
                            ),
                            if (item.isUnread)
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [item.color, item.color.withValues(alpha: 0.7)],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 14,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.time,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFF5F7FA).withValues(alpha: 0),
              const Color(0xFFF5F7FA),
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF667eea).withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_rounded, 'Home', 0),
              _buildNavItem(Icons.school_rounded, 'Kelas', 1),
              _buildNavItem(Icons.notifications_rounded, 'Notifikasi', 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 0 || index == 1) {
          Navigator.of(context).pop();
        } else {
          setState(() => _selectedIndex = index);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18 : 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24, color: Colors.white),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final Color color;
  final bool isUnread;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.color,
    required this.isUnread,
  });
}
