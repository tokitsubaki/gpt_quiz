import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gpt_quiz/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: GptQuiz()));
    expect(find.text('タップしてください'), findsOneWidget);

    await tester.tap(find.byType(Container));
    await tester.pumpAndSettle();
    expect(find.text('挑戦したいクイズを選択してください'), findsOneWidget);
  });
}
