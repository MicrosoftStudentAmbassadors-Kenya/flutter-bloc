import 'package:blocapp/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocapp/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
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
                  heroTag: const Text('Decreament'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decreament();
                  },
                  tooltip: 'Decreament',
                  child: const Icon(Icons.exposure_minus_1),
                ),
                FloatingActionButton(
                  heroTag: const Text('Increament'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increament();
                  },
                  tooltip: 'Increament',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_context) => BlocProvider.value(
                          value: BlocProvider.of<CounterCubit>(context),
                          child: const SecondScreen(
                            title: 'Second Screen',
                            color: Colors.red,
                          ),
                        )));
              },
              child: const Text('Go to second screen.'),
            ),
          ],
        ),
      ),
    );
  }
}
