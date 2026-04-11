// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BasicResult _$BasicResultFromJson(Map<String, dynamic> json) {
  return _BasicResult.fromJson(json);
}

/// @nodoc
mixin _$BasicResult {
  String? get id => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;
  bool? get isAuthenticated => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  dynamic get phoneNumber => throw _privateConstructorUsedError;
  List<String>? get roles => throw _privateConstructorUsedError;
  dynamic get token => throw _privateConstructorUsedError;
  dynamic get expiresOn => throw _privateConstructorUsedError;
  int? get accountType => throw _privateConstructorUsedError;
  DateTime? get refreshTokenExpiration => throw _privateConstructorUsedError;

  /// Serializes this BasicResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasicResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicResultCopyWith<BasicResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicResultCopyWith<$Res> {
  factory $BasicResultCopyWith(
    BasicResult value,
    $Res Function(BasicResult) then,
  ) = _$BasicResultCopyWithImpl<$Res, BasicResult>;
  @useResult
  $Res call({
    String? id,
    dynamic message,
    bool? isAuthenticated,
    String? username,
    String? email,
    dynamic phoneNumber,
    List<String>? roles,
    dynamic token,
    dynamic expiresOn,
    int? accountType,
    DateTime? refreshTokenExpiration,
  });
}

/// @nodoc
class _$BasicResultCopyWithImpl<$Res, $Val extends BasicResult>
    implements $BasicResultCopyWith<$Res> {
  _$BasicResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? isAuthenticated = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? roles = freezed,
    Object? token = freezed,
    Object? expiresOn = freezed,
    Object? accountType = freezed,
    Object? refreshTokenExpiration = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            isAuthenticated: freezed == isAuthenticated
                ? _value.isAuthenticated
                : isAuthenticated // ignore: cast_nullable_to_non_nullable
                      as bool?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            roles: freezed == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            token: freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            expiresOn: freezed == expiresOn
                ? _value.expiresOn
                : expiresOn // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            accountType: freezed == accountType
                ? _value.accountType
                : accountType // ignore: cast_nullable_to_non_nullable
                      as int?,
            refreshTokenExpiration: freezed == refreshTokenExpiration
                ? _value.refreshTokenExpiration
                : refreshTokenExpiration // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BasicResultImplCopyWith<$Res>
    implements $BasicResultCopyWith<$Res> {
  factory _$$BasicResultImplCopyWith(
    _$BasicResultImpl value,
    $Res Function(_$BasicResultImpl) then,
  ) = __$$BasicResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    dynamic message,
    bool? isAuthenticated,
    String? username,
    String? email,
    dynamic phoneNumber,
    List<String>? roles,
    dynamic token,
    dynamic expiresOn,
    int? accountType,
    DateTime? refreshTokenExpiration,
  });
}

/// @nodoc
class __$$BasicResultImplCopyWithImpl<$Res>
    extends _$BasicResultCopyWithImpl<$Res, _$BasicResultImpl>
    implements _$$BasicResultImplCopyWith<$Res> {
  __$$BasicResultImplCopyWithImpl(
    _$BasicResultImpl _value,
    $Res Function(_$BasicResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BasicResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? isAuthenticated = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? roles = freezed,
    Object? token = freezed,
    Object? expiresOn = freezed,
    Object? accountType = freezed,
    Object? refreshTokenExpiration = freezed,
  }) {
    return _then(
      _$BasicResultImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        isAuthenticated: freezed == isAuthenticated
            ? _value.isAuthenticated
            : isAuthenticated // ignore: cast_nullable_to_non_nullable
                  as bool?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        roles: freezed == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        token: freezed == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        expiresOn: freezed == expiresOn
            ? _value.expiresOn
            : expiresOn // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        accountType: freezed == accountType
            ? _value.accountType
            : accountType // ignore: cast_nullable_to_non_nullable
                  as int?,
        refreshTokenExpiration: freezed == refreshTokenExpiration
            ? _value.refreshTokenExpiration
            : refreshTokenExpiration // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicResultImpl implements _BasicResult {
  const _$BasicResultImpl({
    this.id,
    this.message,
    this.isAuthenticated,
    this.username,
    this.email,
    this.phoneNumber,
    final List<String>? roles,
    this.token,
    this.expiresOn,
    this.accountType,
    this.refreshTokenExpiration,
  }) : _roles = roles;

  factory _$BasicResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicResultImplFromJson(json);

  @override
  final String? id;
  @override
  final dynamic message;
  @override
  final bool? isAuthenticated;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final dynamic phoneNumber;
  final List<String>? _roles;
  @override
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic token;
  @override
  final dynamic expiresOn;
  @override
  final int? accountType;
  @override
  final DateTime? refreshTokenExpiration;

  @override
  String toString() {
    return 'BasicResult(id: $id, message: $message, isAuthenticated: $isAuthenticated, username: $username, email: $email, phoneNumber: $phoneNumber, roles: $roles, token: $token, expiresOn: $expiresOn, accountType: $accountType, refreshTokenExpiration: $refreshTokenExpiration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(
              other.phoneNumber,
              phoneNumber,
            ) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.expiresOn, expiresOn) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.refreshTokenExpiration, refreshTokenExpiration) ||
                other.refreshTokenExpiration == refreshTokenExpiration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(message),
    isAuthenticated,
    username,
    email,
    const DeepCollectionEquality().hash(phoneNumber),
    const DeepCollectionEquality().hash(_roles),
    const DeepCollectionEquality().hash(token),
    const DeepCollectionEquality().hash(expiresOn),
    accountType,
    refreshTokenExpiration,
  );

  /// Create a copy of BasicResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicResultImplCopyWith<_$BasicResultImpl> get copyWith =>
      __$$BasicResultImplCopyWithImpl<_$BasicResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicResultImplToJson(this);
  }
}

abstract class _BasicResult implements BasicResult {
  const factory _BasicResult({
    final String? id,
    final dynamic message,
    final bool? isAuthenticated,
    final String? username,
    final String? email,
    final dynamic phoneNumber,
    final List<String>? roles,
    final dynamic token,
    final dynamic expiresOn,
    final int? accountType,
    final DateTime? refreshTokenExpiration,
  }) = _$BasicResultImpl;

  factory _BasicResult.fromJson(Map<String, dynamic> json) =
      _$BasicResultImpl.fromJson;

  @override
  String? get id;
  @override
  dynamic get message;
  @override
  bool? get isAuthenticated;
  @override
  String? get username;
  @override
  String? get email;
  @override
  dynamic get phoneNumber;
  @override
  List<String>? get roles;
  @override
  dynamic get token;
  @override
  dynamic get expiresOn;
  @override
  int? get accountType;
  @override
  DateTime? get refreshTokenExpiration;

  /// Create a copy of BasicResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicResultImplCopyWith<_$BasicResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
