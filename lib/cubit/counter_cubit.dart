import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counterValue: 0));

  void increament() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncreament: true));

  void decreament() => emit(
      CounterState(counterValue: state.counterValue - 1, wasIncreament: false));
}
