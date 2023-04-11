// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizSummary _$$_QuizSummaryFromJson(Map<String, dynamic> json) =>
    _$_QuizSummary(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => QuizResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      category: _$JsonConverterFromJson<String, QuizCategory>(
              json['category'], const QuizCategoryConverter().fromJson) ??
          null,
      completedTime: _$JsonConverterFromJson<Timestamp, DateTime>(
              json['completedTime'], const DateTimeConverter().fromJson) ??
          null,
    );

Map<String, dynamic> _$$_QuizSummaryToJson(_$_QuizSummary instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'category': _$JsonConverterToJson<String, QuizCategory>(
          instance.category, const QuizCategoryConverter().toJson),
      'completedTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.completedTime, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
