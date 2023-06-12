import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/api/name.dart';

final nameProvider = FutureProvider<List>((ref) => fetchData());
