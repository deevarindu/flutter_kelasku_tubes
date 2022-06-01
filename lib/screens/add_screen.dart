import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? judulTeks;
    String? deskripsiTeks;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('KelasKu'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
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
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  judulTeks = value;
                },
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Description',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
                    color: Colors.blueGrey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
