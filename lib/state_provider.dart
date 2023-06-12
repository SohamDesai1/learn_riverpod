import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/providers/state_provider.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: State_Provider())));
}

class State_Provider extends ConsumerWidget {
  const State_Provider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            int count = ref.watch(counterProvider);
            return Text(count.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.state).state++;
          },
          child: const Icon(Icons.add)),
    );
  }
}
