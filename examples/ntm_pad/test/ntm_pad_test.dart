import 'package:flutter_test/flutter_test.dart';
import 'package:ntm_pad/console.dart';
import 'package:ntm_pad/ntm_pad.dart';
import 'package:ntm_pad/run_button.dart';
import 'package:ntm_pad/text_editor.dart';

void main() {
  testWidgets(
    'It should write and run the hello world',
    (WidgetTester tester) async {
      await tester.pumpWidget(const NtmPad());

      await tester.enterText(find.byType(TextEditor), "print 'Hello World!';");
      await tester.tap(find.byType(RunButton));
      await tester.pump();

      expect(find.widgetWithText(Console, 'Hello World!\n'), findsOneWidget);
    },
  );

  testWidgets(
    'It should write and run the addition code sample',
    (WidgetTester tester) async {
      await tester.pumpWidget(const NtmPad());

      await tester.enterText(find.byType(TextEditor), '''
fun add(a, b) {
  return a + b;
}
print add(1, 2);
''');
      await tester.tap(find.byType(RunButton));
      await tester.pump();

      expect(find.widgetWithText(Console, '3\n'), findsOneWidget);
    },
  );
}
