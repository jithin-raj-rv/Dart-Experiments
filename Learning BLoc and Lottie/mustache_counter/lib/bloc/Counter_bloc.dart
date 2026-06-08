import 'package:batman_counter/bloc/Counter_event.dart';
import 'package:batman_counter/bloc/Counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super (CounterState(0)){
    on <Counter_increment_pressed>((event, emit) {
      emit(CounterState(++state.count ));
    },);

    on <Counter_decrement_pressed>((event, emit) {
      if (state.count>0){
      emit(CounterState(--state.count));}
    },);

    on <Counter_zero_pressed>((event, emit) {
      if (state.count>0){
      emit(CounterState(0));}
    },);
  }

}