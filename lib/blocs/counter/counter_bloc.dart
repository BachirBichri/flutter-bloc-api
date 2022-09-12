import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitialState(counter: 0)) {
    on<CounterIncrementEvent>((event, emit) {
      if (state.counter < 10) {
        emit(CounterSuccessState(counter: state.counter + 1));
      } else {
        emit(CounterErrorState(
            counter: state.counter,
            errorMsg: "Counter can't be gretter than 10"));
      }
    });
    on<CounterDecrementEvent>((event, emit) {
      if (state.counter > 0) {
        emit(CounterSuccessState(counter: state.counter - 1));
      } else {
        emit(CounterErrorState(
            counter: state.counter, errorMsg: "Counter can't be less than 0"));
      }
    });
  }
}
