part of 'counting_cubit.dart';

class CountingState extends Equatable {
  final int counting;

  const CountingState({required this.counting});

  factory CountingState.initial(){
    return CountingState(counting: 0);
  }

  @override
  List<Object> get props => [counting];

  @override
  String toString() => 'CountingState(counting: $counting)';

  CountingState copyWith({
    int? counting,
  }) {
    return CountingState(
      counting: counting ?? this.counting,
    );
  }
}
