class CounterState {
  int count;
  int counterPlus;

  CounterState({
    required this.count,
    required this.counterPlus,
  });

  CounterState copyWith({int? count, int? counterPlus}) {
    return CounterState(
      count: count ?? this.count,
      counterPlus: counterPlus ?? this.counterPlus,
    );
  }
}
