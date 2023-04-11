import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required String question,
    required List<String> choices,
    required String answer,
    required String description,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
