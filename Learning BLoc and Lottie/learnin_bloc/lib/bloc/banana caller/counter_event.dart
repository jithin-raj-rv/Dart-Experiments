
import 'package:flutter/animation.dart';

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}


class JumpOnCount extends CounterEvent {
	final AnimationController controller;
	JumpOnCount(this.controller);
}
