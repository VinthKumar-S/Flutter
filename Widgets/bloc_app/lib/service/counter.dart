import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract  class CounterEvent{

}

class IncreamentEvent extends CounterEvent{

}

class DecreamentEvent extends CounterEvent{

}

class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc():super(0){
    on<IncreamentEvent>((event,emit){
      emit(state+1);
    });

    on<DecreamentEvent>((event,emit){
      emit(state-1);
    });
  }
  
}