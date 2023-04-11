import 'package:flutter/material.dart';
import 'package:gpt_quiz/model/quiz_summary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class History extends ConsumerStatefulWidget {
  const History({super.key});

  @override
  HistoryState createState() => HistoryState();
}

final historyProvider = StateProvider<List<QuizSummary>>((ref) => []);

class HistoryState extends ConsumerState<History> {
  @override
  Widget build(BuildContext context) {
    List<QuizSummary> histories = ref.watch(historyProvider.notifier).state;
    final formatter = DateFormat('M/d HH:mm');
    return Scaffold(
      appBar: AppBar(
        title: const Text('履歴'),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 50)),
              Table(
                border: TableBorder.all(color: Colors.grey),
                children: <TableRow>[
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    children: ['回答日時', 'クイズ', '正解数']
                        .map(
                          (e) => Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child:
                                Text(e, style: const TextStyle(fontSize: 20)),
                          ),
                        )
                        .toList(),
                  ),
                  for (QuizSummary history in histories) ...{
                    TableRow(
                      children: [
                        (history.completedTime != null)
                            ? formatter.format(history.completedTime!)
                            : '',
                        history.category!.name,
                        history.results
                            .where((e) => e.isCorrect == true)
                            .length
                            .toString(),
                      ]
                          .map(
                            (e) => Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child:
                                  Text(e, style: const TextStyle(fontSize: 20)),
                            ),
                          )
                          .toList(),
                    ),
                  }
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
