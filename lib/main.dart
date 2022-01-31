import 'package:blocapp/logic/cubit/counter_cubit.dart';
import 'package:blocapp/logic/cubit/internet_cubit.dart';
import 'package:blocapp/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (internetCubitContext) =>
                InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
            create: (counterCubitContext) => CounterCubit())
      ],
      child: MaterialApp(
        title: 'Flutter BLoC App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
