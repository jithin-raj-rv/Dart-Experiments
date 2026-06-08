import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Title(color: Colors.cyan, child: Text('Settings Screen'))),
    );
  }
}