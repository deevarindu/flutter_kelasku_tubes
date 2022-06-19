import 'package:flutter/material.dart';

class MapelDetailScreen extends StatelessWidget {
  const MapelDetailScreen({
    Key? key,
    this.namaPelajaran,
    this.jumlahBab,
  }) : super(key: key);

  final String? namaPelajaran;
  final int? jumlahBab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaPelajaran!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text('Bab ${index + 1}'),
            subtitle: Text('Sub Bab ${index + 1}'),
          );
        }),
        itemCount: jumlahBab!,
      ),
    );
  }
}
