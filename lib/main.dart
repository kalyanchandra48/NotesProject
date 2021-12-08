import 'package:flutter/material.dart';
import 'pages/home_page_components/home_page_components.dart';
import 'package:notesapp/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'dart:async';


Future<void> main() async {
	await HiveInstance.initialiseHive();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}
