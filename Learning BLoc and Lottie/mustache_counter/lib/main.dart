import 'package:batman_counter/bloc/Counter_bloc.dart';
import 'package:batman_counter/pages/CounterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc learn',
      home: BlocProvider(create: (context) => CounterBloc(),
      child: Counterpage(),),
    );
  }
}