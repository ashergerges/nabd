// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_tracking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InvitationTrackingState {
  InvitationModel? get invitationData => throw _privateConstructorUsedError;
  List<InvitationGuestModel> get acceptedList =>
      throw _privateConstructorUsedError;
  List<InvitationGuestModel> get pendingList =>
      throw _privateConstructorUsedError;
  List<InvitationGuestModel> get rejectedList =>
      throw _privateConstructorUsedError;
  int get totalInvited => throw _privateConstructorUsedError;
  double get progressPercent => throw _privateConstructorUsedError;
  int get waitingCount => throw _privateConstructorUsedError;
  int get acceptedCount => throw _privateConstructorUsedError;
  int get rejectedCount => throw _privateConstructorUsedError;
  InvitationTrackingStateStatus get currState =>
      throw _privateConstructorUsedError;
  RefreshController get refreshController => throw _privateConstructorUsedError;

  /// Create a copy of InvitationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvitationTrackingStateCopyWith<InvitationTrackingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationTrackingStateCopyWith<$Res> {
  factory $InvitationTrackingStateCopyWith(
    InvitationTrackingState value,
    $Res Function(InvitationTrackingState) then,
  ) = _$InvitationTrackingStateCopyWithImpl<$Res, InvitationTrackingState>;
  @useResult
  $Res call({
    InvitationModel? invitationData,
    List<InvitationGuestModel> acceptedList,
    List<InvitationGuestModel> pendingList,
    List<InvitationGuestModel> rejectedList,
    int totalInvited,
    double progressPercent,
    int waitingCount,
    int acceptedCount,
    int rejectedCount,
    InvitationTrackingStateStatus currState,
    RefreshController refreshController,
  });

  $InvitationTrackingStateStatusCopyWith<$Res> get currState;
}

/// @nodoc
class _$InvitationTrackingStateCopyWithImpl<
  $Res,
  $Val extends InvitationTrackingState
>
    implements $InvitationTrackingStateCopyWith<$Res> {
  _$InvitationTrackingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvitationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationData = freezed,
    Object? acceptedList = null,
    Object? pendingList = null,
    Object? rejectedList = null,
    Object? totalInvited = null,
    Object? progressPercent = null,
    Object? waitingCount = null,
    Object? acceptedCount = null,
    Object? rejectedCount = null,
    Object? currState = null,
    Object? refreshController = null,
  }) {
    return _then(
      _value.copyWith(
            invitationData: freezed == invitationData
                ? _value.invitationData
                : invitationData // ignore: cast_nullable_to_non_nullable
                      as InvitationModel?,
            acceptedList: null == acceptedList
                ? _value.acceptedList
                : acceptedList // ignore: cast_nullable_to_non_nullable
                      as List<InvitationGuestModel>,
            pendingList: null == pendingList
                ? _value.pendingList
                : pendingList // ignore: cast_nullable_to_non_nullable
                      as List<InvitationGuestModel>,
            rejectedList: null == rejectedList
                ? _value.rejectedList
                : rejectedList // ignore: cast_nullable_to_non_nullable
                      as List<InvitationGuestModel>,
            totalInvited: null == totalInvited
                ? _value.totalInvited
                : totalInvited // ignore: cast_nullable_to_non_nullable
                      as int,
            progressPercent: null == progressPercent
                ? _value.progressPercent
                : progressPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            waitingCount: null == waitingCount
                ? _value.waitingCount
                : waitingCount // ignore: cast_nullable_to_non_nullable
                      as int,
            acceptedCount: null == acceptedCount
                ? _value.acceptedCount
                : acceptedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            rejectedCount: null == rejectedCount
                ? _value.rejectedCount
                : rejectedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            currState: null == currState
                ? _value.currState
                : currState // ignore: cast_nullable_to_non_nullable
                      as InvitationTrackingStateStatus,
            refreshController: null == refreshController
                ? _value.refreshController
                : refreshController // ignore: cast_nullable_to_non_nullable
                      as RefreshController,
          )
          as $Val,
    );
  }

  /// Create a copy of InvitationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitationTrackingStateStatusCopyWith<$Res> get currState {
    return $InvitationTrackingStateStatusCopyWith<$Res>(_value.currState, (
      value,
    ) {
      return _then(_value.copyWith(currState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvitationTrackingStateImplCopyWith<$Res>
    implements $InvitationTrackingStateCopyWith<$Res> {
  factory _$$InvitationTrackingStateImplCopyWith(
    _$InvitationTrackingStateImpl value,
    $Res Function(_$InvitationTrackingStateImpl) then,
  ) = __$$InvitationTrackingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InvitationModel? invitationData,
    List<InvitationGuestModel> acceptedList,
    List<InvitationGuestModel> pendingList,
    List<InvitationGuestModel> rejectedList,
    int totalInvited,
    double progressPercent,
    int waitingCount,
    int acceptedCount,
    int rejectedCount,
    InvitationTrackingStateStatus currState,
    RefreshController refreshController,
  });

  @override
  $InvitationTrackingStateStatusCopyWith<$Res> get currState;
}

/// @nodoc
class __$$InvitationTrackingStateImplCopyWithImpl<$Res>
    extends
        _$InvitationTrackingStateCopyWithImpl<
          $Res,
          _$InvitationTrackingStateImpl
        >
    implements _$$InvitationTrackingStateImplCopyWith<$Res> {
  __$$InvitationTrackingStateImplCopyWithImpl(
    _$InvitationTrackingStateImpl _value,
    $Res Function(_$InvitationTrackingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvitationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationData = freezed,
    Object? acceptedList = null,
    Object? pendingList = null,
    Object? rejectedList = null,
    Object? totalInvited = null,
    Object? progressPercent = null,
    Object? waitingCount = null,
    Object? acceptedCount = null,
    Object? rejectedCount = null,
    Object? currState = null,
    Object? refreshController = null,
  }) {
    return _then(
      _$InvitationTrackingStateImpl(
        invitationData: freezed == invitationData
            ? _value.invitationData
            : invitationData // ignore: cast_nullable_to_non_nullable
                  as InvitationModel?,
        acceptedList: null == acceptedList
            ? _value._acceptedList
            : acceptedList // ignore: cast_nullable_to_non_nullable
                  as List<InvitationGuestModel>,
        pendingList: null == pendingList
            ? _value._pendingList
            : pendingList // ignore: cast_nullable_to_non_nullable
                  as List<InvitationGuestModel>,
        rejectedList: null == rejectedList
            ? _value._rejectedList
            : rejectedList // ignore: cast_nullable_to_non_nullable
                  as List<InvitationGuestModel>,
        totalInvited: null == totalInvited
            ? _value.totalInvited
            : totalInvited // ignore: cast_nullable_to_non_nullable
                  as int,
        progressPercent: null == progressPercent
            ? _value.progressPercent
            : progressPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        waitingCount: null == waitingCount
            ? _value.waitingCount
            : waitingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        acceptedCount: null == acceptedCount
            ? _value.acceptedCount
            : acceptedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        rejectedCount: null == rejectedCount
            ? _value.rejectedCount
            : rejectedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        currState: null == currState
            ? _value.currState
            : currState // ignore: cast_nullable_to_non_nullable
                  as InvitationTrackingStateStatus,
        refreshController: null == refreshController
            ? _value.refreshController
            : refreshController // ignore: cast_nullable_to_non_nullable
                  as RefreshController,
      ),
    );
  }
}

/// @nodoc

class _$InvitationTrackingStateImpl implements _InvitationTrackingState {
  const _$InvitationTrackingStateImpl({
    this.invitationData,
    final List<InvitationGuestModel> acceptedList = const [],
    final List<InvitationGuestModel> pendingList = const [],
    final List<InvitationGuestModel> rejectedList = const [],
    this.totalInvited = 0,
    this.progressPercent = 0.0,
    this.waitingCount = 0,
    this.acceptedCount = 0,
    this.rejectedCount = 0,
    this.currState = const InvitationTrackingStateStatus.initial(),
    required this.refreshController,
  }) : _acceptedList = acceptedList,
       _pendingList = pendingList,
       _rejectedList = rejectedList;

  @override
  final InvitationModel? invitationData;
  final List<InvitationGuestModel> _acceptedList;
  @override
  @JsonKey()
  List<InvitationGuestModel> get acceptedList {
    if (_acceptedList is EqualUnmodifiableListView) return _acceptedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_acceptedList);
  }

  final List<InvitationGuestModel> _pendingList;
  @override
  @JsonKey()
  List<InvitationGuestModel> get pendingList {
    if (_pendingList is EqualUnmodifiableListView) return _pendingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingList);
  }

  final List<InvitationGuestModel> _rejectedList;
  @override
  @JsonKey()
  List<InvitationGuestModel> get rejectedList {
    if (_rejectedList is EqualUnmodifiableListView) return _rejectedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rejectedList);
  }

  @override
  @JsonKey()
  final int totalInvited;
  @override
  @JsonKey()
  final double progressPercent;
  @override
  @JsonKey()
  final int waitingCount;
  @override
  @JsonKey()
  final int acceptedCount;
  @override
  @JsonKey()
  final int rejectedCount;
  @override
  @JsonKey()
  final InvitationTrackingStateStatus currState;
  @override
  final RefreshController refreshController;

  @override
  String toString() {
    return 'InvitationTrackingState(invitationData: $invitationData, acceptedList: $acceptedList, pendingList: $pendingList, rejectedList: $rejectedList, totalInvited: $totalInvited, progressPercent: $progressPercent, waitingCount: $waitingCount, acceptedCount: $acceptedCount, rejectedCount: $rejectedCount, currState: $currState, refreshController: $refreshController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationTrackingStateImpl &&
            (identical(other.invitationData, invitationData) ||
                other.invitationData == invitationData) &&
            const DeepCollectionEquality().equals(
              other._acceptedList,
              _acceptedList,
            ) &&
            const DeepCollectionEquality().equals(
              other._pendingList,
              _pendingList,
            ) &&
            const DeepCollectionEquality().equals(
              other._rejectedList,
              _rejectedList,
            ) &&
            (identical(other.totalInvited, totalInvited) ||
                other.totalInvited == totalInvited) &&
            (identical(other.progressPercent, progressPercent) ||
                other.progressPercent == progressPercent) &&
            (identical(other.waitingCount, waitingCount) ||
                other.waitingCount == waitingCount) &&
            (identical(other.acceptedCount, acceptedCount) ||
                other.acceptedCount == acceptedCount) &&
            (identical(other.rejectedCount, rejectedCount) ||
                other.rejectedCount == rejectedCount) &&
            (identical(other.currState, currState) ||
                other.currState == currState) &&
            (identical(other.refreshController, refreshController) ||
                other.refreshController == refreshController));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    invitationData,
    const DeepCollectionEquality().hash(_acceptedList),
    const DeepCollectionEquality().hash(_pendingList),
    const DeepCollectionEquality().hash(_rejectedList),
    totalInvited,
    progressPercent,
    waitingCount,
    acceptedCount,
    rejectedCount,
    currState,
    refreshController,
  );

  /// Create a copy of InvitationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationTrackingStateImplCopyWith<_$InvitationTrackingStateImpl>
  get copyWith =>
      __$$InvitationTrackingStateImplCopyWithImpl<
        _$InvitationTrackingStateImpl
      >(this, _$identity);
}

abstract class _InvitationTrackingState implements InvitationTrackingState {
  const factory _InvitationTrackingState({
    final InvitationModel? invitationData,
    final List<InvitationGuestModel> acceptedList,
    final List<InvitationGuestModel> pendingList,
    final List<InvitationGuestModel> rejectedList,
    final int totalInvited,
    final double progressPercent,
    final int waitingCount,
    final int acceptedCount,
    final int rejectedCount,
    final InvitationTrackingStateStatus currState,
    required final RefreshController refreshController,
  }) = _$InvitationTrackingStateImpl;

  @override
  InvitationModel? get invitationData;
  @override
  List<InvitationGuestModel> get acceptedList;
  @override
  List<InvitationGuestModel> get pendingList;
  @override
  List<InvitationGuestModel> get rejectedList;
  @override
  int get totalInvited;
  @override
  double get progressPercent;
  @override
  int get waitingCount;
  @override
  int get acceptedCount;
  @override
  int get rejectedCount;
  @override
  InvitationTrackingStateStatus get currState;
  @override
  RefreshController get refreshController;

  /// Create a copy of InvitationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvitationTrackingStateImplCopyWith<_$InvitationTrackingStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvitationTrackingStateStatus {
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
abstract class $InvitationTrackingStateStatusCopyWith<$Res> {
  factory $InvitationTrackingStateStatusCopyWith(
    InvitationTrackingStateStatus value,
    $Res Function(InvitationTrackingStateStatus) then,
  ) =
      _$InvitationTrackingStateStatusCopyWithImpl<
        $Res,
        InvitationTrackingStateStatus
      >;
}

/// @nodoc
class _$InvitationTrackingStateStatusCopyWithImpl<
  $Res,
  $Val extends InvitationTrackingStateStatus
>
    implements $InvitationTrackingStateStatusCopyWith<$Res> {
  _$InvitationTrackingStateStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvitationTrackingStateStatus
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
    extends _$InvitationTrackingStateStatusCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvitationTrackingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'InvitationTrackingStateStatus.initial()';
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

abstract class Initial implements InvitationTrackingStateStatus {
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
    extends _$InvitationTrackingStateStatusCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvitationTrackingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'InvitationTrackingStateStatus.loading()';
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

abstract class Loading implements InvitationTrackingStateStatus {
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
    extends _$InvitationTrackingStateStatusCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvitationTrackingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'InvitationTrackingStateStatus.error()';
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

abstract class Error implements InvitationTrackingStateStatus {
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
    extends _$InvitationTrackingStateStatusCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvitationTrackingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'InvitationTrackingStateStatus.success()';
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

abstract class Success implements InvitationTrackingStateStatus {
  const factory Success() = _$SuccessImpl;
}
