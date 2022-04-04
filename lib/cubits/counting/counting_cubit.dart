import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counting_state.dart';

class CountingCubit extends Cubit<CountingState> {

 CountingCubit(): super(CountingState.initial()){}

  void changeCounting(int incrementSize){
    emit(state.copyWith(counting: state.counting + incrementSize));
  }
}
