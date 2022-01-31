import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocapp/logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
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
                      duration: Duration(milliseconds: 150),
                    ),
                  );
                } else if (state.wasIncreament == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decreamented'),
                      duration: Duration(milliseconds: 150),
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
                  hoverColor: widget.color,
                  onPressed: () {
                    context.read<CounterCubit>().decreament();
                  },
                  tooltip: 'Decreament',
                  child: Icon(
                    Icons.remove,
                    color: widget.color,
                  ),
                ),
                FloatingActionButton(
                  heroTag: const Text('Increament'),
                  hoverColor: widget.color,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increament();
                  },
                  tooltip: 'Increament',
                  child: Icon(
                    Icons.add,
                    color: widget.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
