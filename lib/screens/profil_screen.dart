import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  // User data - editable
  String userName = 'Dandy Candra Pratama';
  String nim = '1202200001';
  String email = 'dandy.candra@student.telkomuniversity.ac.id';
  String jurusan = 'D4 Sistem Multimedia';
  String fakultas = 'Fakultas Ilmu Terapan';
  String angkatan = '2020';
  String noTelp = '081234567890';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildProfileInfo(),
            _buildMenuSection(),
            const SizedBox(height: 32),
          ],
        ),
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
      child: Column(
        children: [
          // App bar
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const Expanded(
                child: Text(
                  'Profil Saya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _showEditProfileDialog(),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Profile avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 56,
              color: Color(0xFFB92B2B),
            ),
          ),
          const SizedBox(height: 16),
          // Name
          Text(
            userName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          // NIM
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              nim,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Role badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF991B1B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'MAHASISWA',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Akademik',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.email_outlined, 'Email', email),
            _buildInfoRow(Icons.school_outlined, 'Jurusan', jurusan),
            _buildInfoRow(Icons.business_outlined, 'Fakultas', fakultas),
            _buildInfoRow(Icons.calendar_today_outlined, 'Angkatan', angkatan),
            _buildInfoRow(Icons.phone_outlined, 'No. Telepon', noTelp),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFEE2E2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFFB92B2B),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildMenuItem(
              Icons.person_outline,
              'Edit Profil',
              'Ubah informasi profil Anda',
              onTap: _showEditProfileDialog,
            ),
            _buildDivider(),
            _buildMenuItem(
              Icons.lock_outline,
              'Ubah Password',
              'Ganti kata sandi akun',
              onTap: () => _showPasswordDialog(),
            ),
            _buildDivider(),
            _buildMenuItem(
              Icons.notifications_outlined,
              'Notifikasi',
              'Pengaturan notifikasi',
              onTap: () {},
            ),
            _buildDivider(),
            _buildMenuItem(
              Icons.help_outline,
              'Bantuan',
              'Pusat bantuan & FAQ',
              onTap: () {},
            ),
            _buildDivider(),
            _buildMenuItem(
              Icons.info_outline,
              'Tentang Aplikasi',
              'Versi 3.0.1',
              onTap: () => _showAboutDialog(),
            ),
            _buildDivider(),
            _buildMenuItem(
              Icons.logout,
              'Keluar',
              'Logout dari akun',
              isLogout: true,
              onTap: () => _showLogoutDialog(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle,
      {bool isLogout = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isLogout
                    ? const Color(0xFFFEE2E2)
                    : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 22,
                color: isLogout
                    ? const Color(0xFFDC2626)
                    : const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isLogout
                          ? const Color(0xFFDC2626)
                          : const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: isLogout
                  ? const Color(0xFFDC2626)
                  : const Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(height: 1, color: Color(0xFFF3F4F6)),
    );
  }

  void _showEditProfileDialog() {
    final nameController = TextEditingController(text: userName);
    final phoneController = TextEditingController(text: noTelp);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Profil',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  filled: true,
                  fillColor: const Color(0xFFF9FAFB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFB92B2B)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'No. Telepon',
                  filled: true,
                  fillColor: const Color(0xFFF9FAFB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFB92B2B)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userName = nameController.text;
                      noTelp = phoneController.text;
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profil berhasil diperbarui'),
                        backgroundColor: Color(0xFF10B981),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB92B2B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showPasswordDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ubah Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Lama',
                  filled: true,
                  fillColor: const Color(0xFFF9FAFB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                  filled: true,
                  fillColor: const Color(0xFFF9FAFB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password Baru',
                  filled: true,
                  fillColor: const Color(0xFFF9FAFB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password berhasil diubah'),
                        backgroundColor: Color(0xFF10B981),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB92B2B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Ubah Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFB92B2B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.school, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LMS App',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'v3.0.1',
                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learning Management System untuk membantu mahasiswa dalam mengakses materi, tugas, dan informasi akademik.',
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 16),
            Text(
              '© 2024 Telkom University',
              style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Keluar'),
        content: const Text('Apakah Anda yakin ingin keluar dari akun?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to login screen
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }
}
