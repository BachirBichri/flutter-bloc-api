import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/themes/custom_theme.dart';

class CounterStateFullPage extends StatefulWidget {
  const CounterStateFullPage({Key? key}) : super(key: key);

  @override
  State<CounterStateFullPage> createState() => _CounterStateFullPageState();
}

class _CounterStateFullPageState extends State<CounterStateFullPage> {
  int counter = 0;
  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter State Full'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Counter value: $counter",
            style: Theme.of(context).textTheme.headline6,
          ),
          errorMsg != ''
              ? Text(
                  errorMsg,
                  style: CustomTheme.errorMsgStyle,
                )
              : const Text('')
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (counter < 1) {
                  errorMsg = "Counter can't be less than 0";
                } else {
                  errorMsg = '';
                  counter--;
                }
              });
            },
            heroTag: null,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (counter > 9) {
                    errorMsg = "Counter can't be gretter than 10";
                  } else {
                    errorMsg = '';
                    counter++;
                  }
                });
              },
              heroTag: null,
              child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
