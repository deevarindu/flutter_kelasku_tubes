class Bab {
  int id;
  int id_mapel;
  String judul_bab;

  Bab({
    required this.id,
    required this.id_mapel,
    required this.judul_bab,
  });

  factory Bab.fromJson(Map<String, dynamic> json) {
    return Bab(
      id: json['id'],
      id_mapel: json['id_mapel'],
      judul_bab: json['judul_bab'],
    );
  }
}
