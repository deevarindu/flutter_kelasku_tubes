class MapelData {
  int id;
  String title;
  String image;

  MapelData({required this.id, required this.title, required this.image});
}

var MapelDataList = [
  MapelData(
      id: 1, title: 'Bahasa Indonesia', image: 'assets/images/mapel/bindo.png'),
  MapelData(
      id: 2,
      title: 'Ilmu Pengetahuan Sosial',
      image: 'assets/images/mapel/ipa.png'),
  MapelData(id: 3, title: 'Matematika', image: 'assets/images/mapel/mtk.png'),
];
