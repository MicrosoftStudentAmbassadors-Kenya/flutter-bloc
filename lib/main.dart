import 'package:blocapp/cubit/counter_cubit.dart';
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
        home: const MyHomePage(title: 'Flutter Bloc App'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncreament == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Increamented'),
                duration: Duration(milliseconds: 300),
              ),
            );
          } else if (state.wasIncreament == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Decreamented'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // BlocBuilder - Re-builds the UI for every new state coming from the bloc.
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      // BlocProvider - Creates & Provides the only instance of a bloc to the subtree.
                      BlocProvider.of<CounterCubit>(context).decreament();
                      // context.bloc<CounterCubit>().decreament();
                    },
                    tooltip: 'Decreament',
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increament();
                      // context.bloc<CounterCubit>().increament();
                    },
                    tooltip: 'Increament',
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
