import 'package:flutter/material.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:provider/provider.dart';

class NotesCard extends StatelessWidget {
  final Note note;

  const NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Provider<NotesOperation>(
      create: (BuildContext context) => NotesOperation(),
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.judul,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                note.deskripsi,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        );
      },
    );
  }
}
