import 'package:flutter/cupertino.dart';
import 'package:flutter_kelasku_tubes/model/models.dart';

class NotesOperation with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation() {
    addNewNote('Catatan', 'Deskripsi Catatan');
  }
  void addNewNote(String judul, String deskripsi) {
    Note note = Note(judul, deskripsi);
    _notes.add(note);
    notifyListeners();
  }
}
