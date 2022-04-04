import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:cubit_bloc/blocs/color/color_bloc.dart';

part 'counting_event.dart';
part 'counting_state.dart';

class CountingBloc extends Bloc<CountingEvent, CountingState> {

int incrementSize = 1;

  CountingBloc() : super(CountingState.initial()) {
    
  //    colorSubscription = colorBloc.stream.listen((ColorState colorState) {
  //     if (colorState.color == Colors.red) {
  //       incrementSize = 1;
  //     } else if (colorState.color == Colors.green) {
  //       incrementSize = 10;
  //     } else if (colorState.color == Colors.blue) {
  //       incrementSize = 100;
  //     } else if (colorState.color == Colors.black) {
  //       incrementSize = -100;
  //       add(ChangeCountingEvent());
  //     }
  // });

   on<ChangeCountingEvent>((event, emit) {
      emit(state.copyWith(counter: state.counting + event.incrementSize));
    });
  }



}
