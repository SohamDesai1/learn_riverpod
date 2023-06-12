// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/providers/family_provider.dart';

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
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Family_Provider())),
            child: const Text("Go")),
      ),
    );
  }
}

class Family_Provider extends ConsumerStatefulWidget {
  const Family_Provider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Family_ProviderState();
}

class _Family_ProviderState extends ConsumerState<Family_Provider> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List groceries = ref.watch(groceriesProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                ref
                    .read(groceriesProvider.notifier)
                    .addGrocery(_textEditingController.text);
                _textEditingController.clear();
              },
              child: const Text("Add")),
          const SizedBox(
            height: 40,
          ),
          if (groceries.isNotEmpty)
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(groceries[index]),
                  );
                },
                itemCount: groceries.length,
              ),
            )
          else
            Container()
        ],
      ),
    );
  }
}
