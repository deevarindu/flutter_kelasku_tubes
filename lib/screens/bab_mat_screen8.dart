import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

class MatematikaBab8 extends StatelessWidget {
  const MatematikaBab8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Matematika Kelas 8'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: babList8Mat.length,
        itemBuilder: (context, index) {
          final Bab8Mat bab8 = babList8Mat[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(bab8.bab),
              ),
              title: Text(bab8.judul),
              subtitle: Text(bab8.subJudul),
              trailing:
                  IconButton(icon: Icon(Icons.chevron_right), onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}