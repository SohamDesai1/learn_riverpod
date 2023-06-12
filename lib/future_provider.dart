// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/api/name.dart';
import 'package:learn_riverpod/providers/fut_provider.dart';

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
                MaterialPageRoute(builder: (context) => const Fut_Provider())),
            child: const Text("Go")),
      ),
    );
  }
}

class Fut_Provider extends ConsumerStatefulWidget {
  const Fut_Provider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Fut_ProviderState();
}

class _Fut_ProviderState extends ConsumerState<Fut_Provider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ref.watch(nameProvider).when(
              data: (data) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(names[index]),
                    );
                  },
                  itemCount: names.length,
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
