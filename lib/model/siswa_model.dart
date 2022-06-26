import 'package:http/http.dart' as http;

class Siswa {
  int? id;
  String? nama;
  int? kelas;
  String? email;
  String? password;

  Siswa({
    this.id,
    this.nama,
    this.kelas,
    this.email,
    this.password,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) {
    return Siswa(
        id: json['id'],
        nama: json['nama'],
        kelas: json['kelas'],
        email: json['email'],
        password: json['password']);
  }
}
