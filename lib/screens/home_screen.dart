import 'package:flutter/material.dart';
import 'kelas_screen.dart';
import 'notifikasi_screen.dart';
import 'profil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  // User name - can be edited from profile later
  String userName = 'Dandy Candra\nPratama';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUpcomingTask(),
                      const SizedBox(height: 32),
                      _buildAnnouncements(),
                      const SizedBox(height: 32),
                      _buildClassProgress(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting & Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo,',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userName.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ],
          ),
          // Role Badge - Tap to go to profile
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 4, top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF7F1D1D).withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFFF87171).withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'MAHASISWA',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF991B1B),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingTask() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tugas Yang Akan Datang',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFB92B2B),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7F1D1D).withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Decorative blur circle
              Positioned(
                top: -40,
                right: -40,
                child: Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Content
              Column(
                children: [
                  Text(
                    'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.9),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tugas 01 - UID Android Mobile Game',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Waktu Pengumpulan',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Jumat 26 Februari, 23:59 WIB',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Pengumuman Terakhir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Lihat Semua',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2563EB),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF3F4F6)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Maintenance Pra UAS Semester Genap 2020/2021',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 160,
                decoration: const BoxDecoration(
                  color: Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCKesXwBu-Rie2tZtFz7uDTUFlUOyFFtQ7rZWRzaHuga43c_ekvksmk61okx5Akj0GX4HwAYumufRJ64RezILrbGKTvnGjFQAIe_XbPeif0eWdEbX6dZj6RAzFD4MrtfdgCuy9GJmS_R6ffsvZn9Hlf70kKx_ujRMbguLRNdhfU4lVRIDsL5XCS0SyAmOI7B5C8RvSlLwyl-hgV83z5mGocfe2UR6cVGvB0rOEFal2wvK-d5KOsY-nRashOoSxcFQ9zlt4Q9yLeU_H0',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.image, size: 48, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildClassProgress() {
    final classes = [
      ClassItem(
        title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
        semester: '2021/2',
        progress: 89,
        gradientColors: [const Color(0xFFFBBF24), const Color(0xFFF97316)],
        icon: 'uiUX',
      ),
      ClassItem(
        title: 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
        semester: '2021/2',
        progress: 86,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBV4qQTmja5L7J4I5r_SY4k5-ABqgCaEFnU-g-9d77hOzhLGBzvNxpon1wHmlVwYHfbUmymt1LZdmFx8aieMj49r1mJsUvWz8b5UeuMgkcSEqALomRQW6RmfoM7aBoswoAxxbOR8DvepSrX7RFLBaTOImvv9iUfx-705Q1_ZwZ_cOSRJFtDHNatL-bDx5I70_oqlT41BScIPWr7wEvSZQSqsvAj9fXBRjAfIhMXE03_kh6vvvpq2BvhblygwgsRB3lTh8icONvCQPYI',
      ),
      ClassItem(
        title: 'SISTEM OPERASI\nD4SM-44-02 [DDS]',
        semester: '2021/2',
        progress: 90,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCLh12c5olR28oZSbdYWDZu_EBoUennT47EpBAy7SMdWrzDz8zrW1QXKSfDGchVCEQ5cZ6MXzcbLALRjgmVTYVz4JERRlglvQTHLUw2xuC-PAchm2VuKhtZNw4H7RNTk06pFPir5q3ZgGfCn74rKeJC43UimM6Z8lh9dLkuNs8qBPSinmWEX1ljsuooJYWl4xiuAdzki_5DJ-IM63PF9ZYYM71xd39vUfgdHRVps6WuFIGj1EGgCHK31Ja0rc44h7dBNS6D8zGs5Fnk',
      ),
      ClassItem(
        title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA D4SM-41-GAB1 [APJ]',
        semester: '2021/2',
        progress: 90,
        gradientColors: [const Color(0xFF5EEAD4), const Color(0xFF22D3EE)],
      ),
      ClassItem(
        title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC D4SM-41-GAB1 [ARS]',
        semester: '2021/2',
        progress: 90,
        gradientColors: [const Color(0xFFD1D5DB), const Color(0xFF9CA3AF)],
      ),
      ClassItem(
        title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF D4SM-43-04 [TPR]',
        semester: '2021/2',
        progress: 90,
        gradientColors: [const Color(0xFF3B82F6), const Color(0xFF60A5FA)],
      ),
      ClassItem(
        title: 'OLAH RAGA\nD3TT-44-02 [EYR]',
        semester: '2021/2',
        progress: 90,
        gradientColors: [const Color(0xFFA855F7), const Color(0xFF6366F1)],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Progres Kelas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 24),
        ...classes.map((classItem) => _buildClassCard(classItem)),
      ],
    );
  }

  Widget _buildClassCard(ClassItem classItem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: classItem.gradientColors != null
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: classItem.gradientColors!,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: classItem.imageUrl != null
                  ? Image.network(
                      classItem.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, color: Colors.grey),
                        );
                      },
                    )
                  : classItem.icon != null
                      ? Center(
                          child: Text(
                            classItem.icon!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : null,
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classItem.semester,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  classItem.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Progress bar
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: classItem.progress / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFB92B2B),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${classItem.progress} % Selesai',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFB92B2B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Home', 0),
                _buildNavItem(Icons.school, 'Kelas Saya', 1),
                _buildNavItem(Icons.notifications, 'Notifikasi', 2),
              ],
            ),
          ),
          Container(
            height: 24,
            color: const Color(0xFFB92B2B),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 1) {
          // Navigate to Kelas Screen
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const KelasScreen()),
          );
        } else if (index == 2) {
          // Navigate to Notifikasi Screen
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NotifikasiScreen()),
          );
        } else {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 28,
            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class ClassItem {
  final String title;
  final String semester;
  final int progress;
  final List<Color>? gradientColors;
  final String? imageUrl;
  final String? icon;

  ClassItem({
    required this.title,
    required this.semester,
    required this.progress,
    this.gradientColors,
    this.imageUrl,
    this.icon,
  });
}
