import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_example/feature/counter/data/data_source/local.dart';
import 'package:mvvm_example/feature/counter/data/repositories/local_repo.dart';
import 'package:mvvm_example/feature/counter/presentation/states/counter_state.dart';
import '../view_models/counter_view_model.dart';
import '../widgets/app_button.dart';

class RiverpodStatefulExample extends ConsumerStatefulWidget {
  const RiverpodStatefulExample({super.key});

  @override
  ConsumerState<RiverpodStatefulExample> createState() =>
      _RiverpodStatefulExampleState();
}

class _RiverpodStatefulExampleState
    extends ConsumerState<RiverpodStatefulExample> {
  final counterProvider = StateNotifierProvider<CounterViewModel, CounterState>(
    (ref) {
      return CounterViewModel(
        CounterState(
          count: 0,
          counterPlus: 0,
        ),
        localDataRepository: LocalDataRepository(
          localDataSource: LocalDataSource(),
        ),
      );
    },
  );

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then(
      (_) {
        /// call this to get the counter history from sharedPreference
        ref.read(counterProvider.notifier).getCounterHistory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild all");
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverpodStatefulExample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${ref.watch(counterProvider).count}'),
            const SizedBox(height: 20),
            AppButton(
              title: "Increase",
              onClicked: () {
                ref.read(counterProvider.notifier).increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
