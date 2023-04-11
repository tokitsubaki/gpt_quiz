import 'package:flutter/material.dart';
import 'package:gpt_quiz/notifier/quiz_result_notifier.dart';
import 'package:gpt_quiz/notifier/quiz_state_notifier.dart';
import 'package:gpt_quiz/notifier/quiz_summary_notifier.dart';
import 'package:gpt_quiz/view/menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/enum/quiz_icon.dart';
import '../model/quiz.dart';
import '../model/quiz_result.dart';

class Question extends ConsumerStatefulWidget {
  const Question({super.key});
  @override
  QuestionState createState() => QuestionState();
}

class QuestionState extends ConsumerState<Question> {
  @override
  void initState() {
    ref
        .read(quizNotifierProvider.notifier)
        .fetchQuiz(ref.read(quizCategoryProvider));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = ref.watch(quizNotifierProvider);
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
              quizProvider.when(
                data: (quiz) => _QuestionView(quiz),
                error: (error) => const _ErrorView(),
                loading: () => const _LoadingView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(padding: EdgeInsets.only(top: 50)),
        CircularProgressIndicator()
      ],
    );
  }
}

class _ErrorView extends ConsumerWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 50)),
          const Text(
            '問題の取得に失敗しました',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const Text(
            '再取得を行ってください',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 50)),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(200),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            icon: const Icon(Icons.refresh, size: 30),
            label: const Text('再取得する', style: TextStyle(fontSize: 24)),
            onPressed: () {
              ref.watch(quizNotifierProvider.notifier).init();
              ref
                  .read(quizNotifierProvider.notifier)
                  .fetchQuiz(ref.read(quizCategoryProvider));
            },
          ),
        ],
      ),
    );
  }
}

class _QuestionView extends ConsumerWidget {
  final Quiz quiz;
  const _QuestionView(this.quiz);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 50)),
          const Text(
            '問題',
            style: TextStyle(
              letterSpacing: 6.0,
              fontSize: 32,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            width: double.maxFinite,
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              quiz.question,
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
                    onPressed: () => _onPressed(context, i + 1, quiz, ref),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                }
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed(BuildContext context, int choise, Quiz quiz, WidgetRef ref) {
    var result = QuizResult(
        quizNo: ref.read(quizSummaryProvider).results.length + 1,
        selectedAnswer: choise,
        isCorrect: quiz.answer == choise.toString());
    ref.read(quizResultProvider.notifier).changeResult(result);
    ref.read(quizSummaryProvider.notifier).addResult(result);
    Navigator.pushNamedAndRemoveUntil(context, 'answer', (choise) => false);
  }
}
