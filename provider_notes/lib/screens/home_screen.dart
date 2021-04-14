import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_notes/models/note.dart';
import 'package:provider_notes/providers/note_collections.dart';
import 'package:provider_notes/screens/note_screen.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  static const uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    NoteCollection collection = Provider.of<NoteCollection>(context);

    return new Scaffold(
      appBar: AppBar(
        title: Consumer<NoteCollection>(
          builder: (_, notes, __) => Text('Notes (${notes.allNotes.length})'),
        ),
      ),
      body: _buildNotesList(collection, context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var note = Note(id: uuid.v4());
          collection.addNote(note);
          _navigateToNoteScreen(context, note);
        },
      ),
    );
  }

  _navigateToNoteScreen(BuildContext context, Note note) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => NoteScreen(note: note)));
  }

  Widget _buildNotesList(NoteCollection collection, BuildContext context) {
    List<Note> allNotes = collection.allNotes;
    if (allNotes.length == 0)
      return Center(
        child: Text('No notes'),
      );
    return ListView.builder(
      itemBuilder: (ctx, idx) {
        Note note = allNotes[idx];
        return Dismissible(
            key: ValueKey(note.id),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (_) {
              collection.deleteNote(note);
            },
            child: ListTile(
              title: Text(note.noteBody),
              onTap: () => _navigateToNoteScreen(context, note),
            ));
      },
      itemCount: allNotes.length,
    );
  }
}
