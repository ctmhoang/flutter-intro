import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_notes/models/note.dart';
import 'package:provider_notes/providers/note_collections.dart';

class NoteScreen extends StatefulWidget {
  final Note _note;

  NoteScreen({@required Note note, Key key}) : _note = note;

  @override
  createState() => NoteScreenState(body: _note.body, id: _note.id, key: key);
}

class NoteScreenState extends State<NoteScreen> {
  final String id;
  String body;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = body;
    _controller.addListener(() {
      Provider.of<NoteCollection>(context, listen: false)
          .updateNote(id, _controller.text);
    });
  }

  NoteScreenState({Key key, @required this.id, this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<NoteCollection>(
          builder: (_, notes, __) => Text(notes.getNote(id).noteBody),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                    hintText: 'Start writing your note here',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20)),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Container(
              child: Consumer<NoteCollection>(builder: (_, notes, __) {
                var note = notes.getNote(id);

                return Row(
                  children: [
                    Text(
                      '${note.body.length} characters',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('${note.body.split(RegExp(r'\W+')).length} words')
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                );
              }),
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.all(20),
            ),
          )
        ],
      ),
    );
  }
}
