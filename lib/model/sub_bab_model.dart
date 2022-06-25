class SubBab {
  int id;
  int id_bab;
  String judul_sub_bab;
  String isi_sub_bab;

  SubBab({
    required this.id,
    required this.id_bab,
    required this.judul_sub_bab,
    required this.isi_sub_bab,
  });

  factory SubBab.fromJson(Map<String, dynamic> json) {
    return SubBab(
      id : json['id'],
      id_bab : json['id_bab'],
      judul_sub_bab : json['judul_sub_bab'],
      isi_sub_bab : json['isi_sub_bab'],
      );
  }
}
