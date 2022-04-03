
part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}