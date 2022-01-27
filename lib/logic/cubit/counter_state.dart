part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool? wasIncreament;

  const CounterState({
    required this.counterValue,
    this.wasIncreament,
  });

  @override
  List<Object?> get props => [
        counterValue,
        wasIncreament,
      ];
}
