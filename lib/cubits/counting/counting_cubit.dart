import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit_bloc/cubits/color/color_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counting_state.dart';

class CountingCubit extends Cubit<CountingState> {
  int incrementSize = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;

 CountingCubit({required this.colorCubit})
  : super(CountingState.initial()){
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      if(colorState.color == Colors.red){
        incrementSize = 1;
      }
      else if(colorState.color == Colors.blue){
        incrementSize = 10;
      }
      else if(colorState.color == Colors.green){
        incrementSize = 100;
      }
      else if(colorState.color == Colors.black){
       emit(state.copyWith(counting: state.counting - 100));
       incrementSize = -100;
      }
    });
  }

  void changeCounting(){
    emit(state.copyWith(counting: state.counting + incrementSize));
  }


  Future<void>close(){
    colorSubscription.cancel();
    return super.close();
  }

}
