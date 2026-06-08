import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/newpage.dart';
import 'countercontroller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Countercontroller controller = Get.put(Countercontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing with GetX"),

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                controller.increment();
              },
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Obx( () => Text(
                    'Counter Value: ${controller.counter.value}',
                    style: const TextStyle(fontSize: 24),
                  )),
                ),
              ),
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:() {
        Get.to(Newpage());
      },),
    );
  }
}