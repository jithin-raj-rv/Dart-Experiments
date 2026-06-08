import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  String dispval = '';
void disp(){
setState(() {
  dispval = 'hello '+ condoler.text ;
});
}
void reset() {
  setState(() {
    dispval = '';
  });
}
TextEditingController condoler =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 

      Padding(
        padding: EdgeInsetsGeometry.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dispval),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Type your babababa'),
              controller: condoler,
              
            ),
            ElevatedButton(onPressed: (){
              disp();
              print(condoler.text);
            }, child: Text('don\'t click meeeeh')),
            ElevatedButton(onPressed: (){
              reset();
            }, child: Text('click meeeeh'))
          ],
        ),
      )
    );
  }
}