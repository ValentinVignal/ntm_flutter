import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The text in the console.
final textConsoleProvider = StateProvider<String>((ref) {
  return '';
});
