import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'text_console_provider.dart';

/// Displays the console output.
class Console extends ConsumerWidget {
  const Console({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(textConsoleProvider));
  }
}
