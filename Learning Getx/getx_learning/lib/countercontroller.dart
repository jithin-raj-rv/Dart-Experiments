import 'package:get/get.dart';

class Countercontroller extends GetxController {
  var counter = 100.obs; // Observable variable

  void increment() {
    counter++;
  }
}