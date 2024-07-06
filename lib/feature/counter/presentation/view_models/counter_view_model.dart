import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/local_repo.dart';
import '../states/counter_state.dart';

class CounterViewModel extends StateNotifier<CounterState> {
  CounterViewModel(super.state,{required this.localDataRepository,});

  LocalDataRepository localDataRepository;

  void increment() {
   state = state.copyWith(count: state.count + 1);
   // to increase the saved value
   localDataRepository.incrementCounter();
  }

  Future<void> getCounterHistory() async{
    state = state.copyWith(count: await localDataRepository.getCounter());
  }

}
