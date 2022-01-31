// import 'package:bloc_test/bloc_test.dart';
import 'package:blocapp/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

// Feature Tests.
void main() {
  group('Counter Cubit', () {
    // Here we use the late modifier to handle a common pattern of state with delayed initialization.
    // https://dart.dev/null-safety/understanding-null-safety
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'Test for initial state for the CounterCubit is CounterState(counterValue: 0)',
        () {
      expect(counterCubit.state, const CounterState(counterValue: 0));
    });

    // blocTest(
    //   'Cubit should emit CounterState(countervalue: 1, wasIncreamented: true) when cubit.increament() is called.',
    //   build: () => counterCubit,
    //   act: (cubit) => cubit.increament(),
    //   expect: [CounterState(counterValue: 1, wasIncreament: true)],
    // );

    // blocTest(
    //   'Cubit should emit CounterState(countervalue: 0, wasIncreamented: false) when cubit.decreament() is called.',
    //   build: () => counterCubit,
    //   act: (cubit) => cubit.decreament(),
    //   expect: [CounterState(counterValue: -1, wasIncreament: false)],
    // );
  });
}
