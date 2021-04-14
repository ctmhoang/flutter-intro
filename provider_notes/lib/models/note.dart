import 'package:flutter/foundation.dart';

class Note {
  static const String DEFAULT_NAME = 'New note';
  String id;
  String body;

  Note({@required this.id, this.body = ''});

  String get noteBody {
    return this.body.isNotEmpty
        ? this.body.split("\n").first
        : Note.DEFAULT_NAME;
  }
}
