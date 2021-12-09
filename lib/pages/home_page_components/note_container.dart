import 'package:flutter/material.dart';
import 'dart:math';
import 'package:Notes/models/models.dart';
import 'package:Notes/pages/home_page_components/home_page_components.dart';
import 'package:Notes/services/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Notes/styles/styles.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final int index;
  NoteWidget({
    required this.note,
    required this.index,
  });
  Color color = AppColors.white;
  updateNotes(BuildContext context) async {
    Global.boxes[BOX_NAME.NOTES_BOX]!.putAt(index, note);
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(note: this.note),
    );
  }

  updateDate() async {
    this.note.createdAt = this.note.createdAt;
    Global.boxes[BOX_NAME.NOTES_BOX]!.putAt(index, this.note);
  }

  updateFav() async {
    this.note.favourite = !this.note.favourite;
    Global.boxes[BOX_NAME.NOTES_BOX]!.putAt(index, this.note);
  }

  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    return '$formattedDate';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 19, right: 19),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(26)),
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade300,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(this.note.title, style: AppFonts.smalltitle),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 10, top: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(this.note.notes, style: AppFonts.smallNote),
                ),
              ),
	      SizedBox(height:10,),
              Padding(
                  padding: EdgeInsets.only(bottom: 4, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Created At ' + getDate(),
                        style: AppFonts.createdAt),
                  )),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 39,
          left: MediaQuery.of(context).size.width / 1.18,
          child: GestureDetector(
            onTap: () {
              NotesService.deleteNoteLocally(note.id);
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xCCffffff),
              child: Icon(Icons.delete_outlined),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 39,
          left: MediaQuery.of(context).size.width / 1.40,
          child: GestureDetector(
            onTap: () {
              updateNotes(context);
            },
            child: CircleAvatar(
              radius: 15,
              child: Icon(Icons.edit_outlined),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 39,
          left: MediaQuery.of(context).size.width / 1.8,
          child: GestureDetector(
            onTap: () {
              updateFav();
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.favorite,
                color: note.favourite == true ? Colors.blue : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
