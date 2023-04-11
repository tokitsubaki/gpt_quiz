import 'package:gpt_quiz/model/enum/quiz_category.dart';
import 'package:gpt_quiz/repository/quiz_repository.dart';
import 'package:gpt_quiz/state/quiz_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/quiz.dart';

class QuizStateNotifier extends StateNotifier<QuizState> {
  QuizStateNotifier(this._quizRepository) : super(const QuizState.loading());
  final QuizRepository _quizRepository;
  late Quiz quiz;

  void init() {
    state = const QuizState.loading();
  }

  void fetchQuiz(QuizCategory category) async {
    try {
      quiz = await _quizRepository.fetchQuiz(category);
      state = QuizState.data(quiz: quiz);
    } catch (_) {
      state = const QuizState.error('error');
    }
  }

  Quiz getQuiz() {
    return quiz;
  }
}

final quizNotifierProvider =
    StateNotifierProvider<QuizStateNotifier, QuizState>(
        (ref) => QuizStateNotifier(ref.watch(quizRepository)));
