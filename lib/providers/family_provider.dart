import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceriesNotifier extends StateNotifier<List<String>> {
  GroceriesNotifier() : super([]);

  void addGrocery(String item) {
    state = [...state, item];
  }
}

final groceriesProvider =
    StateNotifierProvider<GroceriesNotifier, List<String>>(
  (ref) => GroceriesNotifier(),
);
