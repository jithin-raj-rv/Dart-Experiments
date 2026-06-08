
import 'package:demo_app/home/home.dart';
import 'package:demo_app/pages/start.dart';
import 'package:flutter/material.dart';
import 'dart:math';


  Random random = Random ();
int number=random.nextInt(18);

// int a = number;
int i = 0;

class Scissor extends StatelessWidget {
  const Scissor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('SCISSOR            ',style: TextStyle(fontWeight: FontWeight.bold),)),
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
               int a=0;


                if (i>=0 && i<a){
                print(a);
                print(i);
                print('SCISSOR');
                
                Navigator.push(context, MaterialPageRoute(builder:(context) => Start(),));
                i++;}
                else if (i>a) {
                  --i;
                  
                }
                else  {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Start(),));
                  i=0;
                }

                
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                height: 350,
                width: 350,
                
                child: Center(child: Text('SCISSOR',style: TextStyle(fontSize: 55,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),))
                ,
              ),
            ),
          )
        ],
      ),

    );
  }
}