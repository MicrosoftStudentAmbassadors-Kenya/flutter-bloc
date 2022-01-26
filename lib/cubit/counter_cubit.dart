import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increament() => emit(CounterState(counterValue: state.counterValue + 1));

  void decreament() => emit(CounterState(counterValue: state.counterValue - 1));
}
