import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnin_bloc/bloc/banana%20caller/counter_bloc.dart';
import 'package:learnin_bloc/page/banana_home.dart';
import 'package:learnin_bloc/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      theme: AppTheme.lightTheme(context),
      home: BlocProvider(create: (context) => CounterBloc(),
      child: BananaHome()),
      debugShowCheckedModeBanner: false,
    );
  }
}