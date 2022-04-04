part of 'counting_bloc.dart';

abstract class CountingEvent extends Equatable {
  const CountingEvent();

  @override
  List<Object> get props => [];
}


class ChangeCountingEvent extends CountingEvent {}