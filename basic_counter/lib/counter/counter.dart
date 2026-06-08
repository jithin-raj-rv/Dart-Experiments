import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int count=0;

void counter (){
  setState(() {
    count++;
  });
} 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter Demo Project')),
        backgroundColor: Colors.deepPurple[200],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('You have pushed the button this many times')),
          Text(count.toString(),style: TextStyle(fontSize: 35),),
          ElevatedButton(onPressed: () {
            counter();
          }, child: Text('Click Me '))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Text('+',style: TextStyle(fontSize: 25),),
        onPressed: (){
        print('+ 1');
        counter();
      }),
    );
  }
}