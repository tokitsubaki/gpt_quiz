import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gpt_quiz/model/quiz_result.dart';
import 'package:gpt_quiz/model/quiz_summary.dart';
import 'package:gpt_quiz/notifier/quiz_result_notifier.dart';
import 'package:gpt_quiz/notifier/quiz_summary_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/enum/quiz_icon.dart';
import '../model/quiz.dart';
import '../notifier/quiz_state_notifier.dart';
import '../repository/firebase_repository.dart';
import 'menu.dart';

class Answer extends ConsumerStatefulWidget {
  const Answer({super.key});

  @override
  AnswerState createState() => AnswerState();
}

class AnswerState extends ConsumerState<Answer> {
  @override
  Widget build(BuildContext context) {
    Quiz quiz = ref.watch(quizNotifierProvider.notifier).getQuiz();
    QuizResult result = ref.watch(quizResultProvider);
    QuizSummary summary = ref.watch(quizSummaryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(quizCategoryProvider).getFullName()),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  (result.isCorrect)
                      ? const Icon(Icons.panorama_fish_eye,
                          color: Colors.green, size: 32)
                      : const Icon(Icons.close, color: Colors.red, size: 32),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    '正解は ${quiz.answer} です',
                    style: const TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  quiz.description,
                  style: const TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < quiz.choices.length; i++) ...{
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          fixedSize: const Size.fromWidth(double.maxFinite),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          disabledBackgroundColor:
                              (quiz.answer == (i + 1).toString())
                                  ? Colors.green.shade100
                                  : Colors.grey.shade200,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        icon: Icon(
                          QuizIcon.getIconById(i + 1),
                          size: 30,
                        ),
                        label: Text(
                          quiz.choices[i],
                          style: const TextStyle(fontSize: 20),
                        ),
                        onPressed: null,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    }
                  ],
                ),
              ),
              (summary.results.length < 3)
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50)),
                      onPressed: () => _onPressedNext(context, ref),
                      child:
                          const Text("次の問題へ", style: TextStyle(fontSize: 20)))
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50)),
                      onPressed: () => _onPressedSummary(context, ref),
                      child:
                          const Text("結果を確認する", style: TextStyle(fontSize: 20)),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedNext(context, ref) {
    ref.watch(quizNotifierProvider.notifier).init();
    Navigator.pushNamedAndRemoveUntil(context, 'question', (_) => false);
  }

  void _onPressedSummary(context, ref) async {
    ref.read(quizSummaryProvider.notifier).setCompletedTime(DateTime.now());
    final QuizSummary summary = ref.read(quizSummaryProvider);
    if (ref.read(userProvider.notifier).state != null) {
      final User user = ref.read(userProvider.notifier).state;
      await ref.read(firebaseProvider).storeQuizSummary(user, summary);
    }
    Navigator.pushNamedAndRemoveUntil(context, 'summary', (_) => false);
  }
}
