// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BasicResponse<T> _$BasicResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _BasicResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BasicResponse<T> {
  int? get statusCode => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  bool? get isError => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  T? get result => throw _privateConstructorUsedError;

  /// Serializes this BasicResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicResponseCopyWith<T, BasicResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicResponseCopyWith<T, $Res> {
  factory $BasicResponseCopyWith(
    BasicResponse<T> value,
    $Res Function(BasicResponse<T>) then,
  ) = _$BasicResponseCopyWithImpl<T, $Res, BasicResponse<T>>;
  @useResult
  $Res call({
    int? statusCode,
    DateTime? timestamp,
    bool? isError,
    String? message,
    T? result,
  });
}

/// @nodoc
class _$BasicResponseCopyWithImpl<T, $Res, $Val extends BasicResponse<T>>
    implements $BasicResponseCopyWith<T, $Res> {
  _$BasicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? timestamp = freezed,
    Object? isError = freezed,
    Object? message = freezed,
    Object? result = freezed,
  }) {
    return _then(
      _value.copyWith(
            statusCode: freezed == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                      as int?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isError: freezed == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                      as bool?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            result: freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as T?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BasicResponseImplCopyWith<T, $Res>
    implements $BasicResponseCopyWith<T, $Res> {
  factory _$$BasicResponseImplCopyWith(
    _$BasicResponseImpl<T> value,
    $Res Function(_$BasicResponseImpl<T>) then,
  ) = __$$BasicResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    int? statusCode,
    DateTime? timestamp,
    bool? isError,
    String? message,
    T? result,
  });
}

/// @nodoc
class __$$BasicResponseImplCopyWithImpl<T, $Res>
    extends _$BasicResponseCopyWithImpl<T, $Res, _$BasicResponseImpl<T>>
    implements _$$BasicResponseImplCopyWith<T, $Res> {
  __$$BasicResponseImplCopyWithImpl(
    _$BasicResponseImpl<T> _value,
    $Res Function(_$BasicResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of BasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? timestamp = freezed,
    Object? isError = freezed,
    Object? message = freezed,
    Object? result = freezed,
  }) {
    return _then(
      _$BasicResponseImpl<T>(
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isError: freezed == isError
            ? _value.isError
            : isError // ignore: cast_nullable_to_non_nullable
                  as bool?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        result: freezed == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BasicResponseImpl<T> implements _BasicResponse<T> {
  const _$BasicResponseImpl({
    this.statusCode,
    this.timestamp,
    this.isError,
    this.message,
    this.result,
  });

  factory _$BasicResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$BasicResponseImplFromJson(json, fromJsonT);

  @override
  final int? statusCode;
  @override
  final DateTime? timestamp;
  @override
  final bool? isError;
  @override
  final String? message;
  @override
  final T? result;

  @override
  String toString() {
    return 'BasicResponse<$T>(statusCode: $statusCode, timestamp: $timestamp, isError: $isError, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicResponseImpl<T> &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    statusCode,
    timestamp,
    isError,
    message,
    const DeepCollectionEquality().hash(result),
  );

  /// Create a copy of BasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicResponseImplCopyWith<T, _$BasicResponseImpl<T>> get copyWith =>
      __$$BasicResponseImplCopyWithImpl<T, _$BasicResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BasicResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _BasicResponse<T> implements BasicResponse<T> {
  const factory _BasicResponse({
    final int? statusCode,
    final DateTime? timestamp,
    final bool? isError,
    final String? message,
    final T? result,
  }) = _$BasicResponseImpl<T>;

  factory _BasicResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$BasicResponseImpl<T>.fromJson;

  @override
  int? get statusCode;
  @override
  DateTime? get timestamp;
  @override
  bool? get isError;
  @override
  String? get message;
  @override
  T? get result;

  /// Create a copy of BasicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicResponseImplCopyWith<T, _$BasicResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
