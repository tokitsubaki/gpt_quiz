import 'package:flutter/material.dart';
import 'package:gpt_quiz/model/quiz_result.dart';
import 'package:gpt_quiz/model/quiz_summary.dart';
import 'package:gpt_quiz/notifier/quiz_summary_notifier.dart';
import 'package:gpt_quiz/view/menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifier/quiz_state_notifier.dart';

class Summary extends ConsumerStatefulWidget {
  const Summary({super.key});

  @override
  SummaryState createState() => SummaryState();
}

class SummaryState extends ConsumerState<Summary> {
  @override
  Widget build(BuildContext context) {
    QuizSummary summary = ref.watch(quizSummaryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(quizCategoryProvider).getFullName()),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              '${summary.results.length}問中${summary.results.where((e) => e.isCorrect).length}問正解でした',
              style: const TextStyle(
                letterSpacing: 2.0,
                fontSize: 32,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: <TableRow>[
                for (QuizResult result in summary.results)
                  TableRow(
                      children: [
                    Text("${result.quizNo} 問目",
                        style: const TextStyle(fontSize: 20)),
                    (result.isCorrect)
                        ? const Icon(Icons.panorama_fish_eye,
                            color: Colors.green, size: 24)
                        : const Icon(Icons.close, color: Colors.red, size: 24)
                  ]
                          .map((e) => Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: e,
                              ))
                          .toList()),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                onPressed: () => _onPressedMenu(context, ref),
                child: const Text("メニューに戻る", style: TextStyle(fontSize: 20)))
          ],
        ),
      ),
    );
  }

  void _onPressedMenu(context, ref) {
    ref.read(quizSummaryProvider.notifier).clear();
    ref.watch(quizNotifierProvider.notifier).init();
    Navigator.pushNamedAndRemoveUntil(context, 'menu', (_) => false);
  }
}
