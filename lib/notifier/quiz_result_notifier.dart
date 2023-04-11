import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/quiz_result.dart';

class QuizResultNotifier extends StateNotifier<QuizResult> {
  QuizResultNotifier(super.state);

  void changeResult(QuizResult result) {
    state = result;
  }
}

final quizResultProvider =
    StateNotifierProvider<QuizResultNotifier, QuizResult>(
  (ref) => QuizResultNotifier(const QuizResult()),
);
