import 'package:flutter/material.dart';

class KonversiSuhu extends StatelessWidget {
  const KonversiSuhu({
    Key? key,
    required this.konversi,
  }) : super(key: key);

  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.orange.shade100,
        ),
        onPressed: () {
          konversi();
        },
        child: Text(
          "Konversi Suhu",
          style: TextStyle(
            fontSize: 16,
            color: Colors.orange.shade700,
          ),
        ),
      ),
    );
  }
}
