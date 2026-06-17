import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    ref.onDispose(() {
      print('CounterNotifier [onDispose]');
    });
    return 0;
  }

  void increment() => state++;
}

final counterProvider = NotifierProvider.autoDispose<CounterNotifier, int>(() => CounterNotifier());
