import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/counter/counter_bloc.dart';
import 'package:flutter_application_1/ui/themes/custom_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterInitialState || state is CounterSuccessState) {
              return Text(
                "Counter value: ${state.counter}",
                style: Theme.of(context).textTheme.headline6,
              );
            } else if (state is CounterErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Counter value: ${state.counter}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    state.errorMsg,
                    style: CustomTheme.errorMsgStyle,
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementEvent());
            }),
        const SizedBox(
          width: 8,
        ),
        FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementEvent());
            })
      ]),
    );
  }
}
