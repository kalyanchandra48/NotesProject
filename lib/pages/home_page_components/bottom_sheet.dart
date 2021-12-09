import 'package:flutter/material.dart';
import 'package:Notes/styles/styles.dart';
import 'package:Notes/models/models.dart';
import 'package:Notes/services/services.dart';
import 'package:Notes/services/notes_service.dart';
import 'dart:math';

class BottomSheetWidget extends StatefulWidget {
  Note? note;
  BottomSheetWidget({this.note});
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late TextEditingController titleController, noteController;

  @override
  initState() {
    super.initState();
    String _title = widget.note == null ? '' : widget.note!.title;
    String _note = widget.note == null ? '' : widget.note!.notes;
    titleController = new TextEditingController(text: _title);
    noteController = new TextEditingController(text: _note);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      height: height / 1.7,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          TextField(
            cursorColor: TextColors.primaryTextColor,
            controller: titleController,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Title..'),
            style: AppFonts.title,
          ),
          TextField(
            cursorColor: TextColors.primaryTextColor,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: noteController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Take a Note..'),
            style: AppFonts.note,
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (titleController.text == '') {
                Navigator.pop(context);
                return;
              }
              if (widget.note == null) {
                final Note n = new Note(
                  title: titleController.text,
                  notes: noteController.text,
                  id: Utils.getSecureString(20),
                  createdAt: DateTime.now(),
                  favourite: false,
                );
                NotesService.saveNoteLocally(n);
              } else {
                final Note n = new Note(
                  title: titleController.text,
                  notes: noteController.text,
                  id: widget.note!.id,
                  createdAt: widget.note!.createdAt,
                  favourite: widget.note!.favourite,
                );
                NotesService.saveNoteLocally(n);
              }
              Navigator.pop(context);
            },
            child: Container(
              height: 70,
              width: width * 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: AppColors.purple),
              child: Center(
                child: Text(
                  'Save',
                  style: AppFonts.save,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
