import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The text in the editor.
final textEditorProvider = StateProvider<String>((ref) {
  return '';
});
