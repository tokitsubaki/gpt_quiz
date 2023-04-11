import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result.freezed.dart';
part 'quiz_result.g.dart';

@freezed
class QuizResult with _$QuizResult {
  const factory QuizResult({
    @Default(0) int quizNo,
    @Default(0) int selectedAnswer,
    @Default(false) bool isCorrect,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) =>
      _$QuizResultFromJson(json);
}
