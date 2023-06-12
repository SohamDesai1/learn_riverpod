// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/providers/counter_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: Home())));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const State_Notifier())),
            child: const Text("Go")),
      ),
    );
  }
}

class State_Notifier extends ConsumerStatefulWidget {
  const State_Notifier({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State_NotifierState();
}

class _State_NotifierState extends ConsumerState<State_Notifier> {
  @override
  Widget build(BuildContext context) {
    int c = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Text(c.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).increment();
          },
          child: const Icon(Icons.add)),
    );
  }
}
