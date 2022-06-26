class Mapel {
  int? id;
  int? kelas;
  String? nama_mapel;

  Mapel({
    this.id,
    this.kelas,
    this.nama_mapel,
  });

  factory Mapel.fromJson(Map<String, dynamic> json) {
    return Mapel(
      id: json['id'],
      kelas: json['kelas'],
      nama_mapel: json['nama_mapel'],
    );
  }
}
