import 'package:flutter/material.dart';
import 'package:Notes/styles/styles.dart';
import 'package:Notes/pages/home_page_components/home_page_components.dart';
import 'package:Notes/models/models.dart';
import 'package:Notes/services/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> title = [];
  List<String> notes = [];
  @override
  bool selected = true;
  bool selectlist = true;
  var Change = Colors.white;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Change,
      appBar: AppBar(
          title: Align(
            alignment: Alignment.topLeft,
            child: Text('NotesApp', style: AppFonts.notesHeader),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 60, top: 5),
              child: IconButton(
                icon: Icon(selected
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onPressed: () {
                  setState(() {
                    selected = !selected;
                    Change == Colors.white
                        ? Change = Colors.black87
                        : Change = Colors.white;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, top: 5),
              child: IconButton(
                icon: Icon(selectlist
                    ? Icons.view_list_outlined
                    : Icons.grid_view_outlined),
                onPressed: () {
                  setState(() {
                    selectlist = !selectlist;
                  });
                },
              ),
            )
          ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 50,
          child: Padding(
            padding: EdgeInsets.only(left: 14, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tap Icon', style: AppFonts.smalltitle),
                Text('To Add A New Note', style: AppFonts.smalltitle),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: null,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheetWidget();
              },
            );
          },
          child: Icon(Icons.note_add_outlined, size: 40, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          NotesWidget(),
        ],
      ),
    );
  }
}
