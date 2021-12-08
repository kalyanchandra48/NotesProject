import 'package:flutter/material.dart';
import 'dart:math';
import 'package:notesapp/models/models.dart';
import 'package:notesapp/pages/home_page_components/home_page_components.dart';
import 'package:notesapp/services/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/styles/styles.dart';

class Squares extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) { 
        return NoteWidget(note: notes[index], index: index);
      }),
    );
  }
}
