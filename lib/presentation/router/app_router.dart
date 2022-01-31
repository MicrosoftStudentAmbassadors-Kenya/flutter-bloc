import 'package:blocapp/logic/cubit/counter_cubit.dart';
import 'package:blocapp/presentation/screens/home_screen.dart';
import 'package:blocapp/presentation/screens/second_screen.dart';
import 'package:blocapp/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
              title: 'BLoC HomePage',
              color: Colors.purpleAccent,
            ),
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
              title: 'Second Screen',
              color: Colors.red,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
              title: 'Third Screen',
              color: Colors.lightGreenAccent,
            ),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('404 Error'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Page Not Found. Try Again.'),
          ),
        );
      },
    );
  }

  void dispose() {
    _counterCubit.close();
  }
}
