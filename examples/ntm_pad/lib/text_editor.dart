import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'text_editor_provider.dart';

/// The text editor where the user can edit its code.
class TextEditor extends ConsumerStatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextEditorState();
}

class _TextEditorState extends ConsumerState<TextEditor> {
  // TODO(ValentinVignal): Use the ntm controller when published.
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      ref.read(textEditorProvider.notifier).state = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      controller: _controller,
      expands: true,
      maxLines: null,
    );
  }
}
