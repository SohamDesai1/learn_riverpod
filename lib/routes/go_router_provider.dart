import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/main.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/home',
        name: "home",
        builder: (context, state) => HomeScreen(
          key: state.pageKey,
        ),
      ),
    ],
    errorBuilder: (context, state) {
      return const Center(child: Text("Error"));
    },
  );
});
