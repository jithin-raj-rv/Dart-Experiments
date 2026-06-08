import 'package:flutter/material.dart';
import 'package:next_project/homescreen.dart';
import 'package:next_project/settings.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   int screen=0;

   void navboi(int scr){
    setState(() {
      screen=scr;
    });
   }

   final List _page =
   [Homescreen(),Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _page[screen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screen,
        onTap: navboi,
        items: [
        BottomNavigationBarItem(
          
          label: 'Home',
          icon: Icon(Icons.home)),
        BottomNavigationBarItem(
          
          label: 'Settings',
          icon: Icon(Icons.settings)),
      ]),






      drawer: 
      Drawer(
        backgroundColor: Colors.cyan,
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.favorite)),
            ListTile(
              iconColor: Colors.cyan[100],
              leading: Icon(Icons.home),
              title: Text('home'),
              onTap: () {
                Navigator.pushNamed(context, '/firstpage');
              },
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Settings'),
                iconColor: Colors.cyan[100],
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/secondpage');
                },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
      ),

     
      
      // Center(
      //   child: ElevatedButton(onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder:(context) => Settings(),));
      //   }, child: Text('Go To Second Page')),
      // ),
    );
  }
}