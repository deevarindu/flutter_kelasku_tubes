class SubBab {
  int id;
  int kelas;
  String nama_mapel;

  SubBab({
    required this.id,
    required this.kelas,
    required this.nama_mapel,
  });

  factory SubBab.fromJson(Map<String, dynamic> json) {
    return SubBab(
      id : json['id'],
      kelas : json['kelas'],
      nama_mapel : json['nama_mapel'],
      );
  }
}
