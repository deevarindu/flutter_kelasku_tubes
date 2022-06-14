import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_kelasku_tubes/screens/screens.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';
import 'package:flutter_kelasku_tubes/widgets/widgets.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<NotesOperation>(
      create: (BuildContext context) => NotesOperation(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.orange,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddScreen(),
                ),
              );
            },
            child: const Icon(Icons.add, size: 30, color: Colors.orange),
            backgroundColor: Colors.white,
          ),
          appBar: AppBar(
            title: const Text(
              'KelasKu',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            child: Consumer<NotesOperation>(
              builder: (context, NotesOperation data, child) {
                return ListView.builder(
                  itemCount: data.getNotes.length,
                  itemBuilder: (context, index) {
                    return NotesCard(data.getNotes[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
