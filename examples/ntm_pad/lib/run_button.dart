import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntm/ntm.dart';
import 'package:ntm_core/ntm_core.dart';

import 'text_console_provider.dart';
import 'text_editor_provider.dart';

class _Logger extends NtmLogger {
  const _Logger(this.ref);

  final WidgetRef ref;

  @override
  void log(NtmLog log) {
    ref.read(textConsoleProvider.notifier).update((state) {
      if (state.isEmpty) {
        return log.log;
      } else {
        return [state, log.log].join('\n');
      }
    });
  }
}

class RunButton extends ConsumerWidget {
  const RunButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(textConsoleProvider.notifier).state = '';
        final logger = _Logger(ref);
        Ntm(logger: logger).run(ref.read(textEditorProvider));
      },
      child: const Icon(Icons.play_arrow),
    );
  }
}
