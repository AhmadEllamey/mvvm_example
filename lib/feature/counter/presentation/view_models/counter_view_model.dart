import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/counter_state.dart';

class CounterViewModel extends StateNotifier<CounterState> {
  CounterViewModel(super.state);

  void increment() {
   state = state.copyWith(count: state.count + 1);
  }

}
