import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementCounter>((event, emit) {
      emit(CounterState(state.jumpCount += 1));
    });
    on<DecrementCounter>((event, emit) {
      if (state.jumpCount>0)
      emit(CounterState(state.jumpCount -= 1));
    });

    on<JumpOnCount>((event, emit) async {
      // Ensure event has controller and duration fields, or pass them as needed
      final controller = event.controller;
      for (var i = state.jumpCount; i > 0; i--) {
        await controller.forward().whenComplete(() {
          controller.reset();
          if (state.jumpCount > 5) {
            controller.duration = Duration(milliseconds: (3000 / (state.jumpCount * 0.3)).toInt());
          } else {
            controller.duration = Duration(milliseconds: 2000);
          }
          print('hello');
        });
        this.add(DecrementCounter());
      }
    });
  }
}