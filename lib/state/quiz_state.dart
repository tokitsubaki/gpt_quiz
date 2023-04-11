import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpt_quiz/model/quiz.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.error([String? error]) = _Error;
  const factory QuizState.loading() = _Loading;
  const factory QuizState.data({required Quiz quiz}) = _Data;
}
