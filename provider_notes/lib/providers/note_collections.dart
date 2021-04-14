import 'package:flutter/widgets.dart';
import 'package:provider_notes/models/note.dart';

class NoteCollection extends ChangeNotifier {
  final List<Note> _notes = [];

  get allNotes => _notes;

  addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(String id, String text) {
    var currNodes = getNote(id);
    if (text.trim() == currNodes.body) return;
    currNodes.body = text;
    notifyListeners();
  }

  Note getNote(String id) {
    return _notes.where((element) => element.id == id).first;
  }
}
