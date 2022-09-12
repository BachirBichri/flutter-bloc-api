part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int counter;

  const CounterState({required this.counter});
}

class CounterInitialState extends CounterState {
  const CounterInitialState({required super.counter});
}

// class CounterInitialState extends CounterState {
//   const CounterInitialState() : super(counter: 0);
// }

class CounterSuccessState extends CounterState {
  const CounterSuccessState({required super.counter});
}

class CounterErrorState extends CounterState {
  final String errorMsg;

  const CounterErrorState({required super.counter, required this.errorMsg});
}
