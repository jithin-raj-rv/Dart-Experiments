
import 'package:demo_app/home/home.dart';
import 'package:demo_app/pages/scissor.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('PAPER            ',style: TextStyle(fontWeight: FontWeight.bold),)),
          ],
        ),
        leading: IconButton(onPressed: ( ) {Navigator.push(context, MaterialPageRoute(builder:(context) => Homescreen(),));}, icon: Icon(Icons.home)),
        backgroundColor: Colors.amberAccent,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                
                Navigator.push(context, MaterialPageRoute(builder:(context) => Scissor(),));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                height: 200,
                width: 200,
                child: Center(child: Text('PAPER',style: TextStyle(fontSize: 55,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),))
                ,
              ),
            ),
          )
        ],
      ),

    );
  }
}