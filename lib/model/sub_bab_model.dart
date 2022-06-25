class SubBab {
  int? id;
  int? kelas;
  String? nama_mapel;

  SubBab({
    this.id,
    this.kelas,
    this.nama_mapel,
  });

  factory SubBab.fromJson(Map<String, dynamic> json) {
    return SubBab(
      id: json['id'],
      kelas: json['nama'],
      nama_mapel: json['kelas'],
    );
  }
}
