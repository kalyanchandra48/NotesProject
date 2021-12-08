import 'package:flutter/material.dart';
import 'package:notesapp/styles/styles.dart';
import 'package:notesapp/pages/home_page_components/home_page_components.dart';
import 'package:notesapp/models/models.dart';
import 'package:notesapp/services/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> title = [];
  List<String> notes = [];
  @override
  bool selected = true;
  var Change = Colors.white;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Change,
      appBar: AppBar(
          title: Align(
            alignment: Alignment.topLeft,
            child: Text('NotesApp', style: AppFonts.notesHeader),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 140, top: 5),
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
            )
          ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 50.0,
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
