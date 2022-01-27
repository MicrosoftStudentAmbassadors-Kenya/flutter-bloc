import 'package:blocapp/logic/cubit/counter_cubit.dart';
import 'package:blocapp/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter BLoC App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomeScreen(
          title: 'Flutter Bloc App',
          color: Colors.yellow,
        ),
      ),
    );
  }
}
