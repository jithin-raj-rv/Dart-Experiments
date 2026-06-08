import 'package:flutter/material.dart';
import 'package:next_project/homepage.dart';
import 'package:next_project/homescreen.dart';
import 'package:next_project/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        '/secondpage':(context) => Settings(),
        '/firstpage' :(context) => Homescreen(),
      },
    );
  }
}