// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizSummary _$QuizSummaryFromJson(Map<String, dynamic> json) {
  return _QuizSummary.fromJson(json);
}

/// @nodoc
mixin _$QuizSummary {
  List<QuizResult> get results => throw _privateConstructorUsedError;
  @QuizCategoryConverter()
  QuizCategory? get category => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get completedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizSummaryCopyWith<QuizSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSummaryCopyWith<$Res> {
  factory $QuizSummaryCopyWith(
          QuizSummary value, $Res Function(QuizSummary) then) =
      _$QuizSummaryCopyWithImpl<$Res, QuizSummary>;
  @useResult
  $Res call(
      {List<QuizResult> results,
      @QuizCategoryConverter() QuizCategory? category,
      @DateTimeConverter() DateTime? completedTime});
}

/// @nodoc
class _$QuizSummaryCopyWithImpl<$Res, $Val extends QuizSummary>
    implements $QuizSummaryCopyWith<$Res> {
  _$QuizSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? category = freezed,
    Object? completedTime = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<QuizResult>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as QuizCategory?,
      completedTime: freezed == completedTime
          ? _value.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizSummaryCopyWith<$Res>
    implements $QuizSummaryCopyWith<$Res> {
  factory _$$_QuizSummaryCopyWith(
          _$_QuizSummary value, $Res Function(_$_QuizSummary) then) =
      __$$_QuizSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuizResult> results,
      @QuizCategoryConverter() QuizCategory? category,
      @DateTimeConverter() DateTime? completedTime});
}

/// @nodoc
class __$$_QuizSummaryCopyWithImpl<$Res>
    extends _$QuizSummaryCopyWithImpl<$Res, _$_QuizSummary>
    implements _$$_QuizSummaryCopyWith<$Res> {
  __$$_QuizSummaryCopyWithImpl(
      _$_QuizSummary _value, $Res Function(_$_QuizSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? category = freezed,
    Object? completedTime = freezed,
  }) {
    return _then(_$_QuizSummary(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<QuizResult>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as QuizCategory?,
      completedTime: freezed == completedTime
          ? _value.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_QuizSummary implements _QuizSummary {
  _$_QuizSummary(
      {final List<QuizResult> results = const [],
      @QuizCategoryConverter() this.category = null,
      @DateTimeConverter() this.completedTime = null})
      : _results = results;

  factory _$_QuizSummary.fromJson(Map<String, dynamic> json) =>
      _$$_QuizSummaryFromJson(json);

  final List<QuizResult> _results;
  @override
  @JsonKey()
  List<QuizResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  @QuizCategoryConverter()
  final QuizCategory? category;
  @override
  @JsonKey()
  @DateTimeConverter()
  final DateTime? completedTime;

  @override
  String toString() {
    return 'QuizSummary(results: $results, category: $category, completedTime: $completedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizSummary &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.completedTime, completedTime) ||
                other.completedTime == completedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), category, completedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizSummaryCopyWith<_$_QuizSummary> get copyWith =>
      __$$_QuizSummaryCopyWithImpl<_$_QuizSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizSummaryToJson(
      this,
    );
  }
}

abstract class _QuizSummary implements QuizSummary {
  factory _QuizSummary(
      {final List<QuizResult> results,
      @QuizCategoryConverter() final QuizCategory? category,
      @DateTimeConverter() final DateTime? completedTime}) = _$_QuizSummary;

  factory _QuizSummary.fromJson(Map<String, dynamic> json) =
      _$_QuizSummary.fromJson;

  @override
  List<QuizResult> get results;
  @override
  @QuizCategoryConverter()
  QuizCategory? get category;
  @override
  @DateTimeConverter()
  DateTime? get completedTime;
  @override
  @JsonKey(ignore: true)
  _$$_QuizSummaryCopyWith<_$_QuizSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
