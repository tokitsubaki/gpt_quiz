import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpt_quiz/model/enum/quiz_category.dart';
import 'package:gpt_quiz/model/quiz_result.dart';

import 'converter/date_time_converter.dart';
import 'converter/quiz_category_converter.dart';

part 'quiz_summary.freezed.dart';
part 'quiz_summary.g.dart';

@freezed
class QuizSummary with _$QuizSummary {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory QuizSummary({
    @Default([]) List<QuizResult> results,
    @Default(null) @QuizCategoryConverter() QuizCategory? category,
    @Default(null) @DateTimeConverter() DateTime? completedTime,
  }) = _QuizSummary;

  factory QuizSummary.fromJson(Map<String, dynamic> json) =>
      _$QuizSummaryFromJson(json);
}
