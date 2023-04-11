// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizResult _$$_QuizResultFromJson(Map<String, dynamic> json) =>
    _$_QuizResult(
      quizNo: json['quizNo'] as int? ?? 0,
      selectedAnswer: json['selectedAnswer'] as int? ?? 0,
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QuizResultToJson(_$_QuizResult instance) =>
    <String, dynamic>{
      'quizNo': instance.quizNo,
      'selectedAnswer': instance.selectedAnswer,
      'isCorrect': instance.isCorrect,
    };
