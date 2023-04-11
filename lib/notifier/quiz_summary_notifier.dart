import 'package:gpt_quiz/model/enum/quiz_category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/quiz_result.dart';
import '../model/quiz_summary.dart';

class QuizSummaryNotifier extends StateNotifier<QuizSummary> {
  QuizSummaryNotifier(super.state);

  void addResult(QuizResult result) {
    state = state.copyWith(results: [...state.results, result]);
  }

  void setCategory(QuizCategory category) {
    state = state.copyWith(category: category);
  }

  void setCompletedTime(DateTime complatedTime) {
    state = state.copyWith(completedTime: complatedTime);
  }

  void clear() {
    state = QuizSummary();
  }
}

final quizSummaryProvider =
    StateNotifierProvider<QuizSummaryNotifier, QuizSummary>(
  (ref) => QuizSummaryNotifier(QuizSummary()),
);
