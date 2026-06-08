

import 'package:demo_app/home/home.dart';
import 'package:demo_app/pages/rock.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('CLICK TO START GAME',style: TextStyle(fontWeight: FontWeight.bold),)),
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
                Navigator.push(context, MaterialPageRoute(builder:(context) => rock(),));
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text('START',style: TextStyle(fontSize: 55,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)),
              
              ),
            ),
          )
        ],
      ),
    );
  }
}