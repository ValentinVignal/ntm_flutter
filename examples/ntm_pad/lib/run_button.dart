import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntm/ntm.dart';

import 'text_console_provider.dart';
import 'text_editor_provider.dart';

// TODO(ValentinVignal): Delete this class when ntm doesn't use `io` anymore
class _Stdout implements Stdout {
  final buffer = StringBuffer();

  @override
  Encoding get encoding => throw UnimplementedError();

  @override
  void add(List<int> data) {}

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future addStream(Stream<List<int>> stream) {
    throw UnimplementedError();
  }

  @override
  Future close() {
    throw UnimplementedError();
  }

  @override
  Future get done => throw UnimplementedError();

  @override
  Future flush() {
    throw UnimplementedError();
  }

  @override
  bool get hasTerminal => throw UnimplementedError();

  @override
  IOSink get nonBlocking => throw UnimplementedError();

  @override
  bool get supportsAnsiEscapes => throw UnimplementedError();

  @override
  int get terminalColumns => throw UnimplementedError();

  @override
  int get terminalLines => throw UnimplementedError();

  @override
  void write(Object? object) {}

  @override
  void writeAll(Iterable objects, [String sep = ""]) {}

  @override
  void writeCharCode(int charCode) {}

  @override
  void writeln([Object? object = ""]) {
    buffer.writeln(object);
  }

  @override
  set encoding(Encoding encoding) {}
}

class RunButton extends ConsumerWidget {
  const RunButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        final stdout = _Stdout();
        ref.read(textConsoleProvider.notifier).state = '';
        // TODO(ValentinVignal): Don't use the IOOverrides when ntm doesn't use `io` anymore.
        IOOverrides.runZoned(
          () {
            Ntm().run(ref.read(textEditorProvider));
          },
          stdout: () => stdout,
          stderr: () => stdout,
        );
        ref.read(textConsoleProvider.notifier).state = stdout.buffer.toString();
      },
      child: const Icon(Icons.play_arrow),
    );
  }
}
