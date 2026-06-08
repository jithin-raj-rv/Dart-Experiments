import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart' show Hive;

class Homepage extends StatefulWidget {
  
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _myBox=Hive.box('mybox');

  void create(){
      _myBox.put(1, ['hello',10,200]);
  }

  void delete(){
    _myBox.delete(1);
  }

  void read(){
    print(_myBox.get(1));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: delete, child: Icon(Icons.delete)),
            TextButton(onPressed: create, child: Icon(Icons.add)),
            TextButton(onPressed: read, child: Icon(Icons.arrow_back)),
           
          ],
        ),
      ),
    );
  }
}