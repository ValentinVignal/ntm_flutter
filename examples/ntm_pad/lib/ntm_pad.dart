import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'console.dart';
import 'run_button.dart';
import 'text_editor.dart';
import 'theme.dart';

class NtmPad extends StatelessWidget {
  const NtmPad({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'NTM pad',
        theme: buildTheme(Brightness.light),
        darkTheme: buildTheme(Brightness.dark),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('NTM pad'),
          ),
          floatingActionButton: const RunButton(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextEditor(),
                ),
              ),
              Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Console(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
