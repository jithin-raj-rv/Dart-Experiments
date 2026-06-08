import 'package:demo_app/pages/start.dart';
import 'package:flutter/material.dart';



class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.airplane_ticket_rounded))],
        backgroundColor: Colors.amberAccent,
        title: Center(
          child: Text('Yello   ',
          style: TextStyle(
            color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
            )
            ),
            
      ),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(
          child: GestureDetector(
            onTap:() {
            
              Navigator.push(context, MaterialPageRoute(builder:(context) => Start(),));
            } ,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
              child: Center(child:
               Text('Click Me',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
               ),
            ),
          ),
        )],
      )
      // Stack(
      //   alignment: Alignment.topRight,
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(color: Colors.amber),
      //       width: 200,
      //       height: 200,
      //     ),
      //     Container(
      //       decoration: BoxDecoration(color: Colors.black),
      //       width: 100,
      //       height: 100,
      //     ),
      //     Container(
      //       decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 119, 255)),
      //       width: 50,
      //       height: 50,
      //     ),
      //   ],
      // )
      
      // GridView.builder(
      //   itemCount: 69,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      //    itemBuilder: (context, index) => Container(color: Colors.amber,margin: EdgeInsets.all(1),),),
      // body:
      // ListView.builder(
      //   itemCount: names.length,
      //   itemBuilder:(context,index) => ListTile(
      //     title: Text(names[index],style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
      //   ),),
      // body: Center(
      //   child: ListView(
      //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     // crossAxisAlignment: CrossAxisAlignment.center,
      //     scrollDirection: Axis.vertical,
      //     children: [
      //       Container(
              
      //         height: 200,
      //         width: 500,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(25),
      //           color: Colors.black
      //           ),
      //         padding: EdgeInsets.all(80),
              
      //         // color: Colors.amber,
      //         child: Center(child: Icon(Icons.favorite,color: Colors.amber,size: 50,)),
              
              
      //       ),
      //     Container(
      //       height: 200,
      //       width: 300,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(25),
      //         color: Colors.black
      //         ),
      //       padding: EdgeInsets.all(40),
            
      //       // color: Colors.amber,
      //       child: Center(child: Icon(Icons.favorite,color: Colors.amber,size: 50,)),
            
            
      //     ),
      //     Container(
      //       height: 200,
      //       width: 300,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(25),
      //         color: Colors.black
      //         ),
      //       padding: EdgeInsets.all(20),
            
      //       // color: Colors.amber,
      //       child: Center(child: Icon(Icons.favorite,color: Colors.amber,size: 50,)),
            
            
      //     ),
      //      Container(
              
      //         height: 200,
      //         width: 300,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(25),
      //           color: Colors.black
      //           ),
      //         padding: EdgeInsets.all(80),
              
      //         // color: Colors.amber,
      //         child: Center(child: Icon(Icons.favorite,color: Colors.amber,size: 50,)),
              
              
      //       ),
         
      //     ],
      //   ),
      // ),
    );
  }
}