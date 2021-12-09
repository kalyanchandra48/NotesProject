import 'package:flutter/material.dart';
import 'dart:math';
import 'package:Notes/models/models.dart';
import 'package:Notes/pages/home_page_components/home_page_components.dart';
import 'package:Notes/services/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Notes/styles/styles.dart';

class NotesWidget extends StatefulWidget {
  @override
  _NotesWidgetState createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
          valueListenable: Global.boxes[BOX_NAME.NOTES_BOX]!.listenable(),
          builder: (context, Box box, wid) {
            final List<Note> notes = List<Note>.from(box.values);
            return ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return NoteWidget(note: notes[index], index: index);
              },
            );
          }),
    );
  }
}
