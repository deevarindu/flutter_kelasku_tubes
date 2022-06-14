import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? judulTeks;
    String? deskripsiTeks;

    return Provider<NotesOperation>(
      create: (BuildContext context) => NotesOperation(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.orange,
          appBar: AppBar(
            title: const Text('KelasKu'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 80,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Judul',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      judulTeks = value;
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Masukkan Deskripsi',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        deskripsiTeks = value;
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<NotesOperation>(context, listen: false)
                          .addNewNote(judulTeks!, deskripsiTeks!);
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 10),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Tambahkan Catatan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
