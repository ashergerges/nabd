// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fav_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FavState {
  FavStateStatus get currState => throw _privateConstructorUsedError;
  RefreshController get refreshPackageController =>
      throw _privateConstructorUsedError;
  RefreshController get refreshVendorController =>
      throw _privateConstructorUsedError;
  List<FavVendorModel> get favVendors => throw _privateConstructorUsedError;
  List<FavPackageModel> get favPackages => throw _privateConstructorUsedError;

  /// Create a copy of FavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavStateCopyWith<FavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavStateCopyWith<$Res> {
  factory $FavStateCopyWith(FavState value, $Res Function(FavState) then) =
      _$FavStateCopyWithImpl<$Res, FavState>;
  @useResult
  $Res call({
    FavStateStatus currState,
    RefreshController refreshPackageController,
    RefreshController refreshVendorController,
    List<FavVendorModel> favVendors,
    List<FavPackageModel> favPackages,
  });

  $FavStateStatusCopyWith<$Res> get currState;
}

/// @nodoc
class _$FavStateCopyWithImpl<$Res, $Val extends FavState>
    implements $FavStateCopyWith<$Res> {
  _$FavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currState = null,
    Object? refreshPackageController = null,
    Object? refreshVendorController = null,
    Object? favVendors = null,
    Object? favPackages = null,
  }) {
    return _then(
      _value.copyWith(
            currState: null == currState
                ? _value.currState
                : currState // ignore: cast_nullable_to_non_nullable
                      as FavStateStatus,
            refreshPackageController: null == refreshPackageController
                ? _value.refreshPackageController
                : refreshPackageController // ignore: cast_nullable_to_non_nullable
                      as RefreshController,
            refreshVendorController: null == refreshVendorController
                ? _value.refreshVendorController
                : refreshVendorController // ignore: cast_nullable_to_non_nullable
                      as RefreshController,
            favVendors: null == favVendors
                ? _value.favVendors
                : favVendors // ignore: cast_nullable_to_non_nullable
                      as List<FavVendorModel>,
            favPackages: null == favPackages
                ? _value.favPackages
                : favPackages // ignore: cast_nullable_to_non_nullable
                      as List<FavPackageModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of FavState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FavStateStatusCopyWith<$Res> get currState {
    return $FavStateStatusCopyWith<$Res>(_value.currState, (value) {
      return _then(_value.copyWith(currState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavStateImplCopyWith<$Res>
    implements $FavStateCopyWith<$Res> {
  factory _$$FavStateImplCopyWith(
    _$FavStateImpl value,
    $Res Function(_$FavStateImpl) then,
  ) = __$$FavStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FavStateStatus currState,
    RefreshController refreshPackageController,
    RefreshController refreshVendorController,
    List<FavVendorModel> favVendors,
    List<FavPackageModel> favPackages,
  });

  @override
  $FavStateStatusCopyWith<$Res> get currState;
}

/// @nodoc
class __$$FavStateImplCopyWithImpl<$Res>
    extends _$FavStateCopyWithImpl<$Res, _$FavStateImpl>
    implements _$$FavStateImplCopyWith<$Res> {
  __$$FavStateImplCopyWithImpl(
    _$FavStateImpl _value,
    $Res Function(_$FavStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currState = null,
    Object? refreshPackageController = null,
    Object? refreshVendorController = null,
    Object? favVendors = null,
    Object? favPackages = null,
  }) {
    return _then(
      _$FavStateImpl(
        currState: null == currState
            ? _value.currState
            : currState // ignore: cast_nullable_to_non_nullable
                  as FavStateStatus,
        refreshPackageController: null == refreshPackageController
            ? _value.refreshPackageController
            : refreshPackageController // ignore: cast_nullable_to_non_nullable
                  as RefreshController,
        refreshVendorController: null == refreshVendorController
            ? _value.refreshVendorController
            : refreshVendorController // ignore: cast_nullable_to_non_nullable
                  as RefreshController,
        favVendors: null == favVendors
            ? _value._favVendors
            : favVendors // ignore: cast_nullable_to_non_nullable
                  as List<FavVendorModel>,
        favPackages: null == favPackages
            ? _value._favPackages
            : favPackages // ignore: cast_nullable_to_non_nullable
                  as List<FavPackageModel>,
      ),
    );
  }
}

/// @nodoc

class _$FavStateImpl implements _FavState {
  const _$FavStateImpl({
    this.currState = const FavStateStatus.initial(),
    required this.refreshPackageController,
    required this.refreshVendorController,
    final List<FavVendorModel> favVendors = const [],
    final List<FavPackageModel> favPackages = const [],
  }) : _favVendors = favVendors,
       _favPackages = favPackages;

  @override
  @JsonKey()
  final FavStateStatus currState;
  @override
  final RefreshController refreshPackageController;
  @override
  final RefreshController refreshVendorController;
  final List<FavVendorModel> _favVendors;
  @override
  @JsonKey()
  List<FavVendorModel> get favVendors {
    if (_favVendors is EqualUnmodifiableListView) return _favVendors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favVendors);
  }

  final List<FavPackageModel> _favPackages;
  @override
  @JsonKey()
  List<FavPackageModel> get favPackages {
    if (_favPackages is EqualUnmodifiableListView) return _favPackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favPackages);
  }

  @override
  String toString() {
    return 'FavState(currState: $currState, refreshPackageController: $refreshPackageController, refreshVendorController: $refreshVendorController, favVendors: $favVendors, favPackages: $favPackages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavStateImpl &&
            (identical(other.currState, currState) ||
                other.currState == currState) &&
            (identical(
                  other.refreshPackageController,
                  refreshPackageController,
                ) ||
                other.refreshPackageController == refreshPackageController) &&
            (identical(
                  other.refreshVendorController,
                  refreshVendorController,
                ) ||
                other.refreshVendorController == refreshVendorController) &&
            const DeepCollectionEquality().equals(
              other._favVendors,
              _favVendors,
            ) &&
            const DeepCollectionEquality().equals(
              other._favPackages,
              _favPackages,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currState,
    refreshPackageController,
    refreshVendorController,
    const DeepCollectionEquality().hash(_favVendors),
    const DeepCollectionEquality().hash(_favPackages),
  );

  /// Create a copy of FavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavStateImplCopyWith<_$FavStateImpl> get copyWith =>
      __$$FavStateImplCopyWithImpl<_$FavStateImpl>(this, _$identity);
}

abstract class _FavState implements FavState {
  const factory _FavState({
    final FavStateStatus currState,
    required final RefreshController refreshPackageController,
    required final RefreshController refreshVendorController,
    final List<FavVendorModel> favVendors,
    final List<FavPackageModel> favPackages,
  }) = _$FavStateImpl;

  @override
  FavStateStatus get currState;
  @override
  RefreshController get refreshPackageController;
  @override
  RefreshController get refreshVendorController;
  @override
  List<FavVendorModel> get favVendors;
  @override
  List<FavPackageModel> get favPackages;

  /// Create a copy of FavState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavStateImplCopyWith<_$FavStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavStateStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavStateStatusCopyWith<$Res> {
  factory $FavStateStatusCopyWith(
    FavStateStatus value,
    $Res Function(FavStateStatus) then,
  ) = _$FavStateStatusCopyWithImpl<$Res, FavStateStatus>;
}

/// @nodoc
class _$FavStateStatusCopyWithImpl<$Res, $Val extends FavStateStatus>
    implements $FavStateStatusCopyWith<$Res> {
  _$FavStateStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FavStateStatusCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FavStateStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FavStateStatus {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FavStateStatusCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FavStateStatus.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements FavStateStatus {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FavStateStatusCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'FavStateStatus.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements FavStateStatus {
  const factory Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$FavStateStatusCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'FavStateStatus.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements FavStateStatus {
  const factory Success() = _$SuccessImpl;
}
