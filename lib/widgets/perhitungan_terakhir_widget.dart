import 'package:flutter/material.dart';

class PerhitunganTerakhir extends StatelessWidget {
  const PerhitunganTerakhir({
    Key? key,
    required this.hasilKonversi,
  }) : super(key: key);

  final double hasilKonversi;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$hasilKonversi",
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
