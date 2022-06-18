import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.judul, required this.gambar})
      : super(key: key);

  final String? judul;
  final String? gambar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        //menambahkan bayangan
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      gambar!,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(judul!),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('Lihat Latihan Soal')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
