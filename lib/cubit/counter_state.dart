part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool? wasIncreament;

  CounterState({
    required this.counterValue,
    this.wasIncreament,
  });
}
