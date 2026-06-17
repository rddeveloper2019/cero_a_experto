import 'package:cero_a_experto/presentation/widgets/theme_toggle.dart';
import 'package:cero_a_experto/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Counter'),
        actions: [
          ThemeToggle(),
        ],
      ),
      body: Center(
        child: Text(
          "Count: $counter",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(counterProvider.notifier).increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
