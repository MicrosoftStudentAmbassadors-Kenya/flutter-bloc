import 'package:blocapp/logic/cubit/counter_cubit.dart';
import 'package:blocapp/presentation/router/app_router.dart';
import 'package:blocapp/presentation/screens/home_screen.dart';
import 'package:blocapp/presentation/screens/second_screen.dart';
import 'package:blocapp/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      // routes: {
      //   '/': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const HomeScreen(
      //           title: 'BLoC HomePage',
      //           color: Colors.purpleAccent,
      //         ),
      //       ),
      //   '/second': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const SecondScreen(
      //           title: 'Second Screen',
      //           color: Colors.red,
      //         ),
      //       ),
      //   '/third': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const ThirdScreen(
      //           title: 'Third Screen',
      //           color: Colors.lightGreenAccent,
      //         ),
      //       ),
      // },
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
