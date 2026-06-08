
import 'package:batman_counter/bloc/Counter_bloc.dart';
import 'package:batman_counter/bloc/Counter_event.dart';
import 'package:batman_counter/bloc/Counter_state.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class Counterpage extends StatelessWidget {
  const Counterpage({super.key});
  
  @override
  Widget build(BuildContext context) {

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    final counterBloc =context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("moshi Mushtashes")),
      ),
      body: BlocBuilder<CounterBloc,CounterState>(
        builder:(context, state) {
        return Stack(
        children: [for(int i=0;i<state.count;i++)
        Positioned(
          top: Random().nextInt((screenheight.toInt())-125).toDouble(),
          left: Random().nextInt((screenwidth.toInt())-50).toDouble(),
          child: Image.asset("images/bread.png",height: 60,))
      ],
      );
      },),
      
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed:() {
            counterBloc.add(Counter_increment_pressed());
          },),
          SizedBox(height: 5),

          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed:() {
            counterBloc.add(Counter_decrement_pressed());
          },),
          SizedBox(height: 5),

          FloatingActionButton(
            child: Icon(Icons.exposure_zero),
            onPressed:() {
            counterBloc.add(Counter_zero_pressed());
          },),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}