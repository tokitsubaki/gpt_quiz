// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizResult _$QuizResultFromJson(Map<String, dynamic> json) {
  return _QuizResult.fromJson(json);
}

/// @nodoc
mixin _$QuizResult {
  int get quizNo => throw _privateConstructorUsedError;
  int get selectedAnswer => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizResultCopyWith<QuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultCopyWith<$Res> {
  factory $QuizResultCopyWith(
          QuizResult value, $Res Function(QuizResult) then) =
      _$QuizResultCopyWithImpl<$Res, QuizResult>;
  @useResult
  $Res call({int quizNo, int selectedAnswer, bool isCorrect});
}

/// @nodoc
class _$QuizResultCopyWithImpl<$Res, $Val extends QuizResult>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizNo = null,
    Object? selectedAnswer = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      quizNo: null == quizNo
          ? _value.quizNo
          : quizNo // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizResultCopyWith<$Res>
    implements $QuizResultCopyWith<$Res> {
  factory _$$_QuizResultCopyWith(
          _$_QuizResult value, $Res Function(_$_QuizResult) then) =
      __$$_QuizResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quizNo, int selectedAnswer, bool isCorrect});
}

/// @nodoc
class __$$_QuizResultCopyWithImpl<$Res>
    extends _$QuizResultCopyWithImpl<$Res, _$_QuizResult>
    implements _$$_QuizResultCopyWith<$Res> {
  __$$_QuizResultCopyWithImpl(
      _$_QuizResult _value, $Res Function(_$_QuizResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizNo = null,
    Object? selectedAnswer = null,
    Object? isCorrect = null,
  }) {
    return _then(_$_QuizResult(
      quizNo: null == quizNo
          ? _value.quizNo
          : quizNo // ignore: cast_nullable_to_non_nullable
              as int,
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizResult implements _QuizResult {
  const _$_QuizResult(
      {this.quizNo = 0, this.selectedAnswer = 0, this.isCorrect = false});

  factory _$_QuizResult.fromJson(Map<String, dynamic> json) =>
      _$$_QuizResultFromJson(json);

  @override
  @JsonKey()
  final int quizNo;
  @override
  @JsonKey()
  final int selectedAnswer;
  @override
  @JsonKey()
  final bool isCorrect;

  @override
  String toString() {
    return 'QuizResult(quizNo: $quizNo, selectedAnswer: $selectedAnswer, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizResult &&
            (identical(other.quizNo, quizNo) || other.quizNo == quizNo) &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quizNo, selectedAnswer, isCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizResultCopyWith<_$_QuizResult> get copyWith =>
      __$$_QuizResultCopyWithImpl<_$_QuizResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizResultToJson(
      this,
    );
  }
}

abstract class _QuizResult implements QuizResult {
  const factory _QuizResult(
      {final int quizNo,
      final int selectedAnswer,
      final bool isCorrect}) = _$_QuizResult;

  factory _QuizResult.fromJson(Map<String, dynamic> json) =
      _$_QuizResult.fromJson;

  @override
  int get quizNo;
  @override
  int get selectedAnswer;
  @override
  bool get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$_QuizResultCopyWith<_$_QuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}
