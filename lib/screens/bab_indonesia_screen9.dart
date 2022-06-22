import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

class BahasaIndonesiaBab9 extends StatelessWidget {
  const BahasaIndonesiaBab9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Bahasa Indonesia Kelas 9'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: babList9.length,
        itemBuilder: (context, index) {
          final Bab9 bab9 = babList9[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(bab9.bab),
              ),
              title: Text(bab9.judul),
              subtitle: Text(bab9.subJudul),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
