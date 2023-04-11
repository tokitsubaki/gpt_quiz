import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/quiz_category.dart';

class QuizCategoryConverter implements JsonConverter<QuizCategory, String> {
  const QuizCategoryConverter();

  @override
  QuizCategory fromJson(String json) {
    return QuizCategoryExtension.getCategory(json);
  }

  @override
  String toJson(QuizCategory category) {
    return QuizCategoryExtension.toCategoryString(category);
  }
}
