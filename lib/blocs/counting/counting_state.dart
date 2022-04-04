part of 'counting_bloc.dart';

class CountingState extends Equatable {
  final int counting;
  CountingState({
    required this.counting,
  });

  factory CountingState.initial() {
    return CountingState(counting: 0);
  }

  @override
  List<Object> get props => [counting];

  @override
  String toString() => 'CounterState(counter: $counting)';

  CountingState copyWith({
    int? counter,
  }) {
    return CountingState(
      counting: counter ?? this.counting,
    );
  }
}

