// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyBookingState {
  BookingDetailsModel? get bookDetails => throw _privateConstructorUsedError;
  MyBookingStateStatus get currState => throw _privateConstructorUsedError;
  List<BookingDetailsModel> get booksUpcoming =>
      throw _privateConstructorUsedError;
  List<BookingDetailsModel> get booksCancelled =>
      throw _privateConstructorUsedError;
  List<BookingDetailsModel> get booksCompleted =>
      throw _privateConstructorUsedError;
  int get booksCompletedPage => throw _privateConstructorUsedError;
  int get booksCancelledPage => throw _privateConstructorUsedError;
  int get booksUpcomingPage => throw _privateConstructorUsedError;
  RefreshController get refreshControllerUpcoming =>
      throw _privateConstructorUsedError;
  RefreshController get refreshControllerCancelled =>
      throw _privateConstructorUsedError;
  RefreshController get refreshControllerCompleted =>
      throw _privateConstructorUsedError;

  /// Create a copy of MyBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyBookingStateCopyWith<MyBookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookingStateCopyWith<$Res> {
  factory $MyBookingStateCopyWith(
    MyBookingState value,
    $Res Function(MyBookingState) then,
  ) = _$MyBookingStateCopyWithImpl<$Res, MyBookingState>;
  @useResult
  $Res call({
    BookingDetailsModel? bookDetails,
    MyBookingStateStatus currState,
    List<BookingDetailsModel> booksUpcoming,
    List<BookingDetailsModel> booksCancelled,
    List<BookingDetailsModel> booksCompleted,
    int booksCompletedPage,
    int booksCancelledPage,
    int booksUpcomingPage,
    RefreshController refreshControllerUpcoming,
    RefreshController refreshControllerCancelled,
    RefreshController refreshControllerCompleted,
  });

  $MyBookingStateStatusCopyWith<$Res> get currState;
}

/// @nodoc
class _$MyBookingStateCopyWithImpl<$Res, $Val extends MyBookingState>
    implements $MyBookingStateCopyWith<$Res> {
  _$MyBookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookDetails = freezed,
    Object? currState = null,
    Object? booksUpcoming = null,
    Object? booksCancelled = null,
    Object? booksCompleted = null,
    Object? booksCompletedPage = null,
    Object? booksCancelledPage = null,
    Object? booksUpcomingPage = null,
    Object? refreshControllerUpcoming = null,
    Object? refreshControllerCancelled = null,
    Object? refreshControllerCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            bookDetails: freezed == bookDetails
                ? _value.bookDetails
                : bookDetails // ignore: cast_nullable_to_non_nullable
                      as BookingDetailsModel?,
            currState: null == currState
                ? _value.currState
                : currState // ignore: cast_nullable_to_non_nullable
                      as MyBookingStateStatus,
            booksUpcoming: null == booksUpcoming
                ? _value.booksUpcoming
                : booksUpcoming // ignore: cast_nullable_to_non_nullable
                      as List<BookingDetailsModel>,
            booksCancelled: null == booksCancelled
                ? _value.booksCancelled
                : booksCancelled // ignore: cast_nullable_to_non_nullable
                      as List<BookingDetailsModel>,
            booksCompleted: null == booksCompleted
                ? _value.booksCompleted
                : booksCompleted // ignore: cast_nullable_to_non_nullable
                      as List<BookingDetailsModel>,
            booksCompletedPage: null == booksCompletedPage
                ? _value.booksCompletedPage
                : booksCompletedPage // ignore: cast_nullable_to_non_nullable
                      as int,
            booksCancelledPage: null == booksCancelledPage
                ? _value.booksCancelledPage
                : booksCancelledPage // ignore: cast_nullable_to_non_nullable
                      as int,
            booksUpcomingPage: null == booksUpcomingPage
                ? _value.booksUpcomingPage
                : booksUpcomingPage // ignore: cast_nullable_to_non_nullable
                      as int,
            refreshControllerUpcoming: null == refreshControllerUpcoming
                ? _value.refreshControllerUpcoming
                : refreshControllerUpcoming // ignore: cast_nullable_to_non_nullable
                      as RefreshController,
            refreshControllerCancelled: null == refreshControllerCancelled
                ? _value.refreshControllerCancelled
                : refreshControllerCancelled // ignore: cast_nullable_to_non_nullable
                      as RefreshController,
            refreshControllerCompleted: null == refreshControllerCompleted
                ? _value.refreshControllerCompleted
                : refreshControllerCompleted // ignore: cast_nullable_to_non_nullable
                      as RefreshController,
          )
          as $Val,
    );
  }

  /// Create a copy of MyBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MyBookingStateStatusCopyWith<$Res> get currState {
    return $MyBookingStateStatusCopyWith<$Res>(_value.currState, (value) {
      return _then(_value.copyWith(currState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyBookingStateImplCopyWith<$Res>
    implements $MyBookingStateCopyWith<$Res> {
  factory _$$MyBookingStateImplCopyWith(
    _$MyBookingStateImpl value,
    $Res Function(_$MyBookingStateImpl) then,
  ) = __$$MyBookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BookingDetailsModel? bookDetails,
    MyBookingStateStatus currState,
    List<BookingDetailsModel> booksUpcoming,
    List<BookingDetailsModel> booksCancelled,
    List<BookingDetailsModel> booksCompleted,
    int booksCompletedPage,
    int booksCancelledPage,
    int booksUpcomingPage,
    RefreshController refreshControllerUpcoming,
    RefreshController refreshControllerCancelled,
    RefreshController refreshControllerCompleted,
  });

  @override
  $MyBookingStateStatusCopyWith<$Res> get currState;
}

/// @nodoc
class __$$MyBookingStateImplCopyWithImpl<$Res>
    extends _$MyBookingStateCopyWithImpl<$Res, _$MyBookingStateImpl>
    implements _$$MyBookingStateImplCopyWith<$Res> {
  __$$MyBookingStateImplCopyWithImpl(
    _$MyBookingStateImpl _value,
    $Res Function(_$MyBookingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookDetails = freezed,
    Object? currState = null,
    Object? booksUpcoming = null,
    Object? booksCancelled = null,
    Object? booksCompleted = null,
    Object? booksCompletedPage = null,
    Object? booksCancelledPage = null,
    Object? booksUpcomingPage = null,
    Object? refreshControllerUpcoming = null,
    Object? refreshControllerCancelled = null,
    Object? refreshControllerCompleted = null,
  }) {
    return _then(
      _$MyBookingStateImpl(
        bookDetails: freezed == bookDetails
            ? _value.bookDetails
            : bookDetails // ignore: cast_nullable_to_non_nullable
                  as BookingDetailsModel?,
        currState: null == currState
            ? _value.currState
            : currState // ignore: cast_nullable_to_non_nullable
                  as MyBookingStateStatus,
        booksUpcoming: null == booksUpcoming
            ? _value._booksUpcoming
            : booksUpcoming // ignore: cast_nullable_to_non_nullable
                  as List<BookingDetailsModel>,
        booksCancelled: null == booksCancelled
            ? _value._booksCancelled
            : booksCancelled // ignore: cast_nullable_to_non_nullable
                  as List<BookingDetailsModel>,
        booksCompleted: null == booksCompleted
            ? _value._booksCompleted
            : booksCompleted // ignore: cast_nullable_to_non_nullable
                  as List<BookingDetailsModel>,
        booksCompletedPage: null == booksCompletedPage
            ? _value.booksCompletedPage
            : booksCompletedPage // ignore: cast_nullable_to_non_nullable
                  as int,
        booksCancelledPage: null == booksCancelledPage
            ? _value.booksCancelledPage
            : booksCancelledPage // ignore: cast_nullable_to_non_nullable
                  as int,
        booksUpcomingPage: null == booksUpcomingPage
            ? _value.booksUpcomingPage
            : booksUpcomingPage // ignore: cast_nullable_to_non_nullable
                  as int,
        refreshControllerUpcoming: null == refreshControllerUpcoming
            ? _value.refreshControllerUpcoming
            : refreshControllerUpcoming // ignore: cast_nullable_to_non_nullable
                  as RefreshController,
        refreshControllerCancelled: null == refreshControllerCancelled
            ? _value.refreshControllerCancelled
            : refreshControllerCancelled // ignore: cast_nullable_to_non_nullable
                  as RefreshController,
        refreshControllerCompleted: null == refreshControllerCompleted
            ? _value.refreshControllerCompleted
            : refreshControllerCompleted // ignore: cast_nullable_to_non_nullable
                  as RefreshController,
      ),
    );
  }
}

/// @nodoc

class _$MyBookingStateImpl implements _MyBookingState {
  const _$MyBookingStateImpl({
    this.bookDetails,
    this.currState = const MyBookingStateStatus.initial(),
    final List<BookingDetailsModel> booksUpcoming = const [],
    final List<BookingDetailsModel> booksCancelled = const [],
    final List<BookingDetailsModel> booksCompleted = const [],
    this.booksCompletedPage = 1,
    this.booksCancelledPage = 1,
    this.booksUpcomingPage = 1,
    required this.refreshControllerUpcoming,
    required this.refreshControllerCancelled,
    required this.refreshControllerCompleted,
  }) : _booksUpcoming = booksUpcoming,
       _booksCancelled = booksCancelled,
       _booksCompleted = booksCompleted;

  @override
  final BookingDetailsModel? bookDetails;
  @override
  @JsonKey()
  final MyBookingStateStatus currState;
  final List<BookingDetailsModel> _booksUpcoming;
  @override
  @JsonKey()
  List<BookingDetailsModel> get booksUpcoming {
    if (_booksUpcoming is EqualUnmodifiableListView) return _booksUpcoming;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_booksUpcoming);
  }

  final List<BookingDetailsModel> _booksCancelled;
  @override
  @JsonKey()
  List<BookingDetailsModel> get booksCancelled {
    if (_booksCancelled is EqualUnmodifiableListView) return _booksCancelled;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_booksCancelled);
  }

  final List<BookingDetailsModel> _booksCompleted;
  @override
  @JsonKey()
  List<BookingDetailsModel> get booksCompleted {
    if (_booksCompleted is EqualUnmodifiableListView) return _booksCompleted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_booksCompleted);
  }

  @override
  @JsonKey()
  final int booksCompletedPage;
  @override
  @JsonKey()
  final int booksCancelledPage;
  @override
  @JsonKey()
  final int booksUpcomingPage;
  @override
  final RefreshController refreshControllerUpcoming;
  @override
  final RefreshController refreshControllerCancelled;
  @override
  final RefreshController refreshControllerCompleted;

  @override
  String toString() {
    return 'MyBookingState(bookDetails: $bookDetails, currState: $currState, booksUpcoming: $booksUpcoming, booksCancelled: $booksCancelled, booksCompleted: $booksCompleted, booksCompletedPage: $booksCompletedPage, booksCancelledPage: $booksCancelledPage, booksUpcomingPage: $booksUpcomingPage, refreshControllerUpcoming: $refreshControllerUpcoming, refreshControllerCancelled: $refreshControllerCancelled, refreshControllerCompleted: $refreshControllerCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBookingStateImpl &&
            (identical(other.bookDetails, bookDetails) ||
                other.bookDetails == bookDetails) &&
            (identical(other.currState, currState) ||
                other.currState == currState) &&
            const DeepCollectionEquality().equals(
              other._booksUpcoming,
              _booksUpcoming,
            ) &&
            const DeepCollectionEquality().equals(
              other._booksCancelled,
              _booksCancelled,
            ) &&
            const DeepCollectionEquality().equals(
              other._booksCompleted,
              _booksCompleted,
            ) &&
            (identical(other.booksCompletedPage, booksCompletedPage) ||
                other.booksCompletedPage == booksCompletedPage) &&
            (identical(other.booksCancelledPage, booksCancelledPage) ||
                other.booksCancelledPage == booksCancelledPage) &&
            (identical(other.booksUpcomingPage, booksUpcomingPage) ||
                other.booksUpcomingPage == booksUpcomingPage) &&
            (identical(
                  other.refreshControllerUpcoming,
                  refreshControllerUpcoming,
                ) ||
                other.refreshControllerUpcoming == refreshControllerUpcoming) &&
            (identical(
                  other.refreshControllerCancelled,
                  refreshControllerCancelled,
                ) ||
                other.refreshControllerCancelled ==
                    refreshControllerCancelled) &&
            (identical(
                  other.refreshControllerCompleted,
                  refreshControllerCompleted,
                ) ||
                other.refreshControllerCompleted ==
                    refreshControllerCompleted));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookDetails,
    currState,
    const DeepCollectionEquality().hash(_booksUpcoming),
    const DeepCollectionEquality().hash(_booksCancelled),
    const DeepCollectionEquality().hash(_booksCompleted),
    booksCompletedPage,
    booksCancelledPage,
    booksUpcomingPage,
    refreshControllerUpcoming,
    refreshControllerCancelled,
    refreshControllerCompleted,
  );

  /// Create a copy of MyBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyBookingStateImplCopyWith<_$MyBookingStateImpl> get copyWith =>
      __$$MyBookingStateImplCopyWithImpl<_$MyBookingStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MyBookingState implements MyBookingState {
  const factory _MyBookingState({
    final BookingDetailsModel? bookDetails,
    final MyBookingStateStatus currState,
    final List<BookingDetailsModel> booksUpcoming,
    final List<BookingDetailsModel> booksCancelled,
    final List<BookingDetailsModel> booksCompleted,
    final int booksCompletedPage,
    final int booksCancelledPage,
    final int booksUpcomingPage,
    required final RefreshController refreshControllerUpcoming,
    required final RefreshController refreshControllerCancelled,
    required final RefreshController refreshControllerCompleted,
  }) = _$MyBookingStateImpl;

  @override
  BookingDetailsModel? get bookDetails;
  @override
  MyBookingStateStatus get currState;
  @override
  List<BookingDetailsModel> get booksUpcoming;
  @override
  List<BookingDetailsModel> get booksCancelled;
  @override
  List<BookingDetailsModel> get booksCompleted;
  @override
  int get booksCompletedPage;
  @override
  int get booksCancelledPage;
  @override
  int get booksUpcomingPage;
  @override
  RefreshController get refreshControllerUpcoming;
  @override
  RefreshController get refreshControllerCancelled;
  @override
  RefreshController get refreshControllerCompleted;

  /// Create a copy of MyBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyBookingStateImplCopyWith<_$MyBookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MyBookingStateStatus {
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
abstract class $MyBookingStateStatusCopyWith<$Res> {
  factory $MyBookingStateStatusCopyWith(
    MyBookingStateStatus value,
    $Res Function(MyBookingStateStatus) then,
  ) = _$MyBookingStateStatusCopyWithImpl<$Res, MyBookingStateStatus>;
}

/// @nodoc
class _$MyBookingStateStatusCopyWithImpl<
  $Res,
  $Val extends MyBookingStateStatus
>
    implements $MyBookingStateStatusCopyWith<$Res> {
  _$MyBookingStateStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyBookingStateStatus
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
    extends _$MyBookingStateStatusCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyBookingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MyBookingStateStatus.initial()';
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

abstract class Initial implements MyBookingStateStatus {
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
    extends _$MyBookingStateStatusCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyBookingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MyBookingStateStatus.loading()';
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

abstract class Loading implements MyBookingStateStatus {
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
    extends _$MyBookingStateStatusCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyBookingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'MyBookingStateStatus.error()';
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

abstract class Error implements MyBookingStateStatus {
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
    extends _$MyBookingStateStatusCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyBookingStateStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'MyBookingStateStatus.success()';
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

abstract class Success implements MyBookingStateStatus {
  const factory Success() = _$SuccessImpl;
}
