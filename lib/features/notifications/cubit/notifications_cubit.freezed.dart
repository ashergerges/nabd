// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotificationsState {
  NotificationsStateStatus get currentStatus =>
      throw _privateConstructorUsedError;
  List<NotificationModel> get todayNotifications =>
      throw _privateConstructorUsedError;
  List<NotificationModel> get earlyNotifications =>
      throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
    NotificationsState value,
    $Res Function(NotificationsState) then,
  ) = _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
  @useResult
  $Res call({
    NotificationsStateStatus currentStatus,
    List<NotificationModel> todayNotifications,
    List<NotificationModel> earlyNotifications,
    ScrollController scrollController,
    int pageNumber,
  });

  $NotificationsStateStatusCopyWith<$Res> get currentStatus;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStatus = null,
    Object? todayNotifications = null,
    Object? earlyNotifications = null,
    Object? scrollController = null,
    Object? pageNumber = null,
  }) {
    return _then(
      _value.copyWith(
            currentStatus: null == currentStatus
                ? _value.currentStatus
                : currentStatus // ignore: cast_nullable_to_non_nullable
                      as NotificationsStateStatus,
            todayNotifications: null == todayNotifications
                ? _value.todayNotifications
                : todayNotifications // ignore: cast_nullable_to_non_nullable
                      as List<NotificationModel>,
            earlyNotifications: null == earlyNotifications
                ? _value.earlyNotifications
                : earlyNotifications // ignore: cast_nullable_to_non_nullable
                      as List<NotificationModel>,
            scrollController: null == scrollController
                ? _value.scrollController
                : scrollController // ignore: cast_nullable_to_non_nullable
                      as ScrollController,
            pageNumber: null == pageNumber
                ? _value.pageNumber
                : pageNumber // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationsStateStatusCopyWith<$Res> get currentStatus {
    return $NotificationsStateStatusCopyWith<$Res>(_value.currentStatus, (
      value,
    ) {
      return _then(_value.copyWith(currentStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationsStateImplCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$NotificationsStateImplCopyWith(
    _$NotificationsStateImpl value,
    $Res Function(_$NotificationsStateImpl) then,
  ) = __$$NotificationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    NotificationsStateStatus currentStatus,
    List<NotificationModel> todayNotifications,
    List<NotificationModel> earlyNotifications,
    ScrollController scrollController,
    int pageNumber,
  });

  @override
  $NotificationsStateStatusCopyWith<$Res> get currentStatus;
}

/// @nodoc
class __$$NotificationsStateImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsStateImpl>
    implements _$$NotificationsStateImplCopyWith<$Res> {
  __$$NotificationsStateImplCopyWithImpl(
    _$NotificationsStateImpl _value,
    $Res Function(_$NotificationsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStatus = null,
    Object? todayNotifications = null,
    Object? earlyNotifications = null,
    Object? scrollController = null,
    Object? pageNumber = null,
  }) {
    return _then(
      _$NotificationsStateImpl(
        currentStatus: null == currentStatus
            ? _value.currentStatus
            : currentStatus // ignore: cast_nullable_to_non_nullable
                  as NotificationsStateStatus,
        todayNotifications: null == todayNotifications
            ? _value._todayNotifications
            : todayNotifications // ignore: cast_nullable_to_non_nullable
                  as List<NotificationModel>,
        earlyNotifications: null == earlyNotifications
            ? _value._earlyNotifications
            : earlyNotifications // ignore: cast_nullable_to_non_nullable
                  as List<NotificationModel>,
        scrollController: null == scrollController
            ? _value.scrollController
            : scrollController // ignore: cast_nullable_to_non_nullable
                  as ScrollController,
        pageNumber: null == pageNumber
            ? _value.pageNumber
            : pageNumber // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$NotificationsStateImpl implements _NotificationsState {
  const _$NotificationsStateImpl({
    required this.currentStatus,
    final List<NotificationModel> todayNotifications = const [],
    final List<NotificationModel> earlyNotifications = const [],
    required this.scrollController,
    this.pageNumber = 1,
  }) : _todayNotifications = todayNotifications,
       _earlyNotifications = earlyNotifications;

  @override
  final NotificationsStateStatus currentStatus;
  final List<NotificationModel> _todayNotifications;
  @override
  @JsonKey()
  List<NotificationModel> get todayNotifications {
    if (_todayNotifications is EqualUnmodifiableListView)
      return _todayNotifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayNotifications);
  }

  final List<NotificationModel> _earlyNotifications;
  @override
  @JsonKey()
  List<NotificationModel> get earlyNotifications {
    if (_earlyNotifications is EqualUnmodifiableListView)
      return _earlyNotifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_earlyNotifications);
  }

  @override
  final ScrollController scrollController;
  @override
  @JsonKey()
  final int pageNumber;

  @override
  String toString() {
    return 'NotificationsState(currentStatus: $currentStatus, todayNotifications: $todayNotifications, earlyNotifications: $earlyNotifications, scrollController: $scrollController, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsStateImpl &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            const DeepCollectionEquality().equals(
              other._todayNotifications,
              _todayNotifications,
            ) &&
            const DeepCollectionEquality().equals(
              other._earlyNotifications,
              _earlyNotifications,
            ) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStatus,
    const DeepCollectionEquality().hash(_todayNotifications),
    const DeepCollectionEquality().hash(_earlyNotifications),
    scrollController,
    pageNumber,
  );

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsStateImplCopyWith<_$NotificationsStateImpl> get copyWith =>
      __$$NotificationsStateImplCopyWithImpl<_$NotificationsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _NotificationsState implements NotificationsState {
  const factory _NotificationsState({
    required final NotificationsStateStatus currentStatus,
    final List<NotificationModel> todayNotifications,
    final List<NotificationModel> earlyNotifications,
    required final ScrollController scrollController,
    final int pageNumber,
  }) = _$NotificationsStateImpl;

  @override
  NotificationsStateStatus get currentStatus;
  @override
  List<NotificationModel> get todayNotifications;
  @override
  List<NotificationModel> get earlyNotifications;
  @override
  ScrollController get scrollController;
  @override
  int get pageNumber;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsStateImplCopyWith<_$NotificationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationsStateStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateStatusCopyWith<$Res> {
  factory $NotificationsStateStatusCopyWith(
    NotificationsStateStatus value,
    $Res Function(NotificationsStateStatus) then,
  ) = _$NotificationsStateStatusCopyWithImpl<$Res, NotificationsStateStatus>;
}

/// @nodoc
class _$NotificationsStateStatusCopyWithImpl<
  $Res,
  $Val extends NotificationsStateStatus
>
    implements $NotificationsStateStatusCopyWith<$Res> {
  _$NotificationsStateStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsStateStatus
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
    extends _$NotificationsStateStatusCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.initial()';
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
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
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
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements NotificationsStateStatus {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GetNotificationsLoadingImplCopyWith<$Res> {
  factory _$$GetNotificationsLoadingImplCopyWith(
    _$GetNotificationsLoadingImpl value,
    $Res Function(_$GetNotificationsLoadingImpl) then,
  ) = __$$GetNotificationsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsLoadingImplCopyWithImpl<$Res>
    extends
        _$NotificationsStateStatusCopyWithImpl<
          $Res,
          _$GetNotificationsLoadingImpl
        >
    implements _$$GetNotificationsLoadingImplCopyWith<$Res> {
  __$$GetNotificationsLoadingImplCopyWithImpl(
    _$GetNotificationsLoadingImpl _value,
    $Res Function(_$GetNotificationsLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsLoadingImpl implements GetNotificationsLoading {
  const _$GetNotificationsLoadingImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.getNotificationsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return getNotificationsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return getNotificationsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getNotificationsLoading != null) {
      return getNotificationsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return getNotificationsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return getNotificationsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getNotificationsLoading != null) {
      return getNotificationsLoading(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsLoading implements NotificationsStateStatus {
  const factory GetNotificationsLoading() = _$GetNotificationsLoadingImpl;
}

/// @nodoc
abstract class _$$GetNotificationsSuccessImplCopyWith<$Res> {
  factory _$$GetNotificationsSuccessImplCopyWith(
    _$GetNotificationsSuccessImpl value,
    $Res Function(_$GetNotificationsSuccessImpl) then,
  ) = __$$GetNotificationsSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsSuccessImplCopyWithImpl<$Res>
    extends
        _$NotificationsStateStatusCopyWithImpl<
          $Res,
          _$GetNotificationsSuccessImpl
        >
    implements _$$GetNotificationsSuccessImplCopyWith<$Res> {
  __$$GetNotificationsSuccessImplCopyWithImpl(
    _$GetNotificationsSuccessImpl _value,
    $Res Function(_$GetNotificationsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsSuccessImpl implements GetNotificationsSuccess {
  const _$GetNotificationsSuccessImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.getNotificationsSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return getNotificationsSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return getNotificationsSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getNotificationsSuccess != null) {
      return getNotificationsSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return getNotificationsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return getNotificationsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getNotificationsSuccess != null) {
      return getNotificationsSuccess(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsSuccess implements NotificationsStateStatus {
  const factory GetNotificationsSuccess() = _$GetNotificationsSuccessImpl;
}

/// @nodoc
abstract class _$$GetNotificationsErrorImplCopyWith<$Res> {
  factory _$$GetNotificationsErrorImplCopyWith(
    _$GetNotificationsErrorImpl value,
    $Res Function(_$GetNotificationsErrorImpl) then,
  ) = __$$GetNotificationsErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsErrorImplCopyWithImpl<$Res>
    extends
        _$NotificationsStateStatusCopyWithImpl<
          $Res,
          _$GetNotificationsErrorImpl
        >
    implements _$$GetNotificationsErrorImplCopyWith<$Res> {
  __$$GetNotificationsErrorImplCopyWithImpl(
    _$GetNotificationsErrorImpl _value,
    $Res Function(_$GetNotificationsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsErrorImpl implements GetNotificationsError {
  const _$GetNotificationsErrorImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.getNotificationsError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return getNotificationsError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return getNotificationsError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getNotificationsError != null) {
      return getNotificationsError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return getNotificationsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return getNotificationsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getNotificationsError != null) {
      return getNotificationsError(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsError implements NotificationsStateStatus {
  const factory GetNotificationsError() = _$GetNotificationsErrorImpl;
}

/// @nodoc
abstract class _$$GetMoreNotificationsSuccessImplCopyWith<$Res> {
  factory _$$GetMoreNotificationsSuccessImplCopyWith(
    _$GetMoreNotificationsSuccessImpl value,
    $Res Function(_$GetMoreNotificationsSuccessImpl) then,
  ) = __$$GetMoreNotificationsSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMoreNotificationsSuccessImplCopyWithImpl<$Res>
    extends
        _$NotificationsStateStatusCopyWithImpl<
          $Res,
          _$GetMoreNotificationsSuccessImpl
        >
    implements _$$GetMoreNotificationsSuccessImplCopyWith<$Res> {
  __$$GetMoreNotificationsSuccessImplCopyWithImpl(
    _$GetMoreNotificationsSuccessImpl _value,
    $Res Function(_$GetMoreNotificationsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMoreNotificationsSuccessImpl implements GetMoreNotificationsSuccess {
  const _$GetMoreNotificationsSuccessImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.getMoreNotificationsSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoreNotificationsSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return getMoreNotificationsSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return getMoreNotificationsSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getMoreNotificationsSuccess != null) {
      return getMoreNotificationsSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return getMoreNotificationsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return getMoreNotificationsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getMoreNotificationsSuccess != null) {
      return getMoreNotificationsSuccess(this);
    }
    return orElse();
  }
}

abstract class GetMoreNotificationsSuccess implements NotificationsStateStatus {
  const factory GetMoreNotificationsSuccess() =
      _$GetMoreNotificationsSuccessImpl;
}

/// @nodoc
abstract class _$$GetMoreNotificationsErrorImplCopyWith<$Res> {
  factory _$$GetMoreNotificationsErrorImplCopyWith(
    _$GetMoreNotificationsErrorImpl value,
    $Res Function(_$GetMoreNotificationsErrorImpl) then,
  ) = __$$GetMoreNotificationsErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMoreNotificationsErrorImplCopyWithImpl<$Res>
    extends
        _$NotificationsStateStatusCopyWithImpl<
          $Res,
          _$GetMoreNotificationsErrorImpl
        >
    implements _$$GetMoreNotificationsErrorImplCopyWith<$Res> {
  __$$GetMoreNotificationsErrorImplCopyWithImpl(
    _$GetMoreNotificationsErrorImpl _value,
    $Res Function(_$GetMoreNotificationsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMoreNotificationsErrorImpl implements GetMoreNotificationsError {
  const _$GetMoreNotificationsErrorImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.getMoreNotificationsError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoreNotificationsErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return getMoreNotificationsError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return getMoreNotificationsError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getMoreNotificationsError != null) {
      return getMoreNotificationsError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return getMoreNotificationsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return getMoreNotificationsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (getMoreNotificationsError != null) {
      return getMoreNotificationsError(this);
    }
    return orElse();
  }
}

abstract class GetMoreNotificationsError implements NotificationsStateStatus {
  const factory GetMoreNotificationsError() = _$GetMoreNotificationsErrorImpl;
}

/// @nodoc
abstract class _$$MarkNotificationAsReadSuccessImplCopyWith<$Res> {
  factory _$$MarkNotificationAsReadSuccessImplCopyWith(
    _$MarkNotificationAsReadSuccessImpl value,
    $Res Function(_$MarkNotificationAsReadSuccessImpl) then,
  ) = __$$MarkNotificationAsReadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkNotificationAsReadSuccessImplCopyWithImpl<$Res>
    extends
        _$NotificationsStateStatusCopyWithImpl<
          $Res,
          _$MarkNotificationAsReadSuccessImpl
        >
    implements _$$MarkNotificationAsReadSuccessImplCopyWith<$Res> {
  __$$MarkNotificationAsReadSuccessImplCopyWithImpl(
    _$MarkNotificationAsReadSuccessImpl _value,
    $Res Function(_$MarkNotificationAsReadSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkNotificationAsReadSuccessImpl
    implements MarkNotificationAsReadSuccess {
  const _$MarkNotificationAsReadSuccessImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.markNotificationAsReadSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkNotificationAsReadSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return markNotificationAsReadSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return markNotificationAsReadSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (markNotificationAsReadSuccess != null) {
      return markNotificationAsReadSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return markNotificationAsReadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return markNotificationAsReadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (markNotificationAsReadSuccess != null) {
      return markNotificationAsReadSuccess(this);
    }
    return orElse();
  }
}

abstract class MarkNotificationAsReadSuccess
    implements NotificationsStateStatus {
  const factory MarkNotificationAsReadSuccess() =
      _$MarkNotificationAsReadSuccessImpl;
}

/// @nodoc
abstract class _$$MarkNotificationAsReadErrorImplCopyWith<$Res> {
  factory _$$MarkNotificationAsReadErrorImplCopyWith(
    _$MarkNotificationAsReadErrorImpl value,
    $Res Function(_$MarkNotificationAsReadErrorImpl) then,
  ) = __$$MarkNotificationAsReadErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkNotificationAsReadErrorImplCopyWithImpl<$Res>
    extends
        _$NotificationsStateStatusCopyWithImpl<
          $Res,
          _$MarkNotificationAsReadErrorImpl
        >
    implements _$$MarkNotificationAsReadErrorImplCopyWith<$Res> {
  __$$MarkNotificationAsReadErrorImplCopyWithImpl(
    _$MarkNotificationAsReadErrorImpl _value,
    $Res Function(_$MarkNotificationAsReadErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkNotificationAsReadErrorImpl implements MarkNotificationAsReadError {
  const _$MarkNotificationAsReadErrorImpl();

  @override
  String toString() {
    return 'NotificationsStateStatus.markNotificationAsReadError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkNotificationAsReadErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsLoading,
    required TResult Function() getNotificationsSuccess,
    required TResult Function() getNotificationsError,
    required TResult Function() getMoreNotificationsSuccess,
    required TResult Function() getMoreNotificationsError,
    required TResult Function() markNotificationAsReadSuccess,
    required TResult Function() markNotificationAsReadError,
  }) {
    return markNotificationAsReadError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsLoading,
    TResult? Function()? getNotificationsSuccess,
    TResult? Function()? getNotificationsError,
    TResult? Function()? getMoreNotificationsSuccess,
    TResult? Function()? getMoreNotificationsError,
    TResult? Function()? markNotificationAsReadSuccess,
    TResult? Function()? markNotificationAsReadError,
  }) {
    return markNotificationAsReadError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsLoading,
    TResult Function()? getNotificationsSuccess,
    TResult Function()? getNotificationsError,
    TResult Function()? getMoreNotificationsSuccess,
    TResult Function()? getMoreNotificationsError,
    TResult Function()? markNotificationAsReadSuccess,
    TResult Function()? markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (markNotificationAsReadError != null) {
      return markNotificationAsReadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetNotificationsLoading value)
    getNotificationsLoading,
    required TResult Function(GetNotificationsSuccess value)
    getNotificationsSuccess,
    required TResult Function(GetNotificationsError value)
    getNotificationsError,
    required TResult Function(GetMoreNotificationsSuccess value)
    getMoreNotificationsSuccess,
    required TResult Function(GetMoreNotificationsError value)
    getMoreNotificationsError,
    required TResult Function(MarkNotificationAsReadSuccess value)
    markNotificationAsReadSuccess,
    required TResult Function(MarkNotificationAsReadError value)
    markNotificationAsReadError,
  }) {
    return markNotificationAsReadError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult? Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult? Function(GetNotificationsError value)? getNotificationsError,
    TResult? Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult? Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult? Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult? Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
  }) {
    return markNotificationAsReadError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetNotificationsLoading value)? getNotificationsLoading,
    TResult Function(GetNotificationsSuccess value)? getNotificationsSuccess,
    TResult Function(GetNotificationsError value)? getNotificationsError,
    TResult Function(GetMoreNotificationsSuccess value)?
    getMoreNotificationsSuccess,
    TResult Function(GetMoreNotificationsError value)?
    getMoreNotificationsError,
    TResult Function(MarkNotificationAsReadSuccess value)?
    markNotificationAsReadSuccess,
    TResult Function(MarkNotificationAsReadError value)?
    markNotificationAsReadError,
    required TResult orElse(),
  }) {
    if (markNotificationAsReadError != null) {
      return markNotificationAsReadError(this);
    }
    return orElse();
  }
}

abstract class MarkNotificationAsReadError implements NotificationsStateStatus {
  const factory MarkNotificationAsReadError() =
      _$MarkNotificationAsReadErrorImpl;
}
