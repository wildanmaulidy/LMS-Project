class UserModel {
  final String id;
  final String nama;
  final String email;
  final String nim;
  final String jurusan;
  final String semester;
  final String? photoUrl;
  final String? phone;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.nim,
    required this.jurusan,
    required this.semester,
    this.photoUrl,
    this.phone,
  });

  UserModel copyWith({
    String? id,
    String? nama,
    String? email,
    String? nim,
    String? jurusan,
    String? semester,
    String? photoUrl,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      nim: nim ?? this.nim,
      jurusan: jurusan ?? this.jurusan,
      semester: semester ?? this.semester,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'nim': nim,
      'jurusan': jurusan,
      'semester': semester,
      'photoUrl': photoUrl,
      'phone': phone,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      nim: json['nim'] ?? '',
      jurusan: json['jurusan'] ?? '',
      semester: json['semester'] ?? '',
      photoUrl: json['photoUrl'],
      phone: json['phone'],
    );
  }
}
