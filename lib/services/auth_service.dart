import '../models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  UserModel? _currentUser;
  bool _isLoggedIn = false;

  // Dummy credentials
  static const String _dummyEmail = 'mahasiswa@university.ac.id';
  static const String _dummyPassword = '123456';

  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  Future<Map<String, dynamic>> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // Only validate that email is not empty
    if (email.isEmpty) {
      return {
        'success': false,
        'message': 'Email tidak boleh kosong',
      };
    }

    if (!email.contains('@')) {
      return {
        'success': false,
        'message': 'Format email tidak valid',
      };
    }

    // Accept any email - create user with email as name
    final userName = email.split('@').first.replaceAll('.', ' ');
    final formattedName = userName.split(' ').map((word) => 
      word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : ''
    ).join(' ');

    _currentUser = UserModel(
      id: '1',
      nama: formattedName.isNotEmpty ? formattedName : 'Mahasiswa',
      email: email,
      nim: '2024123456',
      jurusan: 'Teknik Informatika',
      semester: 'Semester 5',
      phone: '081234567890',
    );
    _isLoggedIn = true;

    return {
      'success': true,
      'message': 'Login berhasil',
      'user': _currentUser,
    };
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    _isLoggedIn = false;
  }

  void updateUser(UserModel user) {
    _currentUser = user;
  }

  Future<Map<String, dynamic>> changePassword(
    String oldPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      return {
        'success': false,
        'message': 'Semua field harus diisi',
      };
    }

    if (oldPassword != _dummyPassword) {
      return {
        'success': false,
        'message': 'Password lama salah',
      };
    }

    if (newPassword.length < 6) {
      return {
        'success': false,
        'message': 'Password baru minimal 6 karakter',
      };
    }

    if (newPassword != confirmPassword) {
      return {
        'success': false,
        'message': 'Konfirmasi password tidak cocok',
      };
    }

    return {
      'success': true,
      'message': 'Password berhasil diubah',
    };
  }
}
