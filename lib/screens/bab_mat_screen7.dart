import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

class MatematikaBab7 extends StatelessWidget {
  const MatematikaBab7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Matematika Kelas 7'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: babList7Mat.length,
        itemBuilder: (context, index) {
          final Bab7Mat bab7 = babList7Mat[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(bab7.bab),
              ),
              title: Text(bab7.judul),
              subtitle: Text(bab7.subJudul),
              trailing: IconButton(
                  icon: const Icon(Icons.chevron_right), onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}
