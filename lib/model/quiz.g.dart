// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      question: json['question'] as String,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      answer: json['answer'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'question': instance.question,
      'choices': instance.choices,
      'answer': instance.answer,
      'description': instance.description,
    };
