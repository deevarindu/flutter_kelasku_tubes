import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

class MatematikaBab9 extends StatelessWidget {
  const MatematikaBab9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Matematika Kelas 9'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: babList9Mat.length,
        itemBuilder: (context, index) {
          final Bab9Mat bab9 = babList9Mat[index];
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
                  icon: const Icon(Icons.chevron_right), onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}
