// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TabBarState {
  int get activeScreen => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int activeScreen) tabBarIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int activeScreen)? tabBarIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int activeScreen)? tabBarIndex,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TabBarIndex value) tabBarIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TabBarIndex value)? tabBarIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TabBarIndex value)? tabBarIndex,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of TabBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabBarStateCopyWith<TabBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabBarStateCopyWith<$Res> {
  factory $TabBarStateCopyWith(
    TabBarState value,
    $Res Function(TabBarState) then,
  ) = _$TabBarStateCopyWithImpl<$Res, TabBarState>;
  @useResult
  $Res call({int activeScreen});
}

/// @nodoc
class _$TabBarStateCopyWithImpl<$Res, $Val extends TabBarState>
    implements $TabBarStateCopyWith<$Res> {
  _$TabBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeScreen = null}) {
    return _then(
      _value.copyWith(
            activeScreen: null == activeScreen
                ? _value.activeScreen
                : activeScreen // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TabBarIndexImplCopyWith<$Res>
    implements $TabBarStateCopyWith<$Res> {
  factory _$$TabBarIndexImplCopyWith(
    _$TabBarIndexImpl value,
    $Res Function(_$TabBarIndexImpl) then,
  ) = __$$TabBarIndexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int activeScreen});
}

/// @nodoc
class __$$TabBarIndexImplCopyWithImpl<$Res>
    extends _$TabBarStateCopyWithImpl<$Res, _$TabBarIndexImpl>
    implements _$$TabBarIndexImplCopyWith<$Res> {
  __$$TabBarIndexImplCopyWithImpl(
    _$TabBarIndexImpl _value,
    $Res Function(_$TabBarIndexImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TabBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activeScreen = null}) {
    return _then(
      _$TabBarIndexImpl(
        activeScreen: null == activeScreen
            ? _value.activeScreen
            : activeScreen // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$TabBarIndexImpl implements TabBarIndex {
  const _$TabBarIndexImpl({this.activeScreen = 0});

  @override
  @JsonKey()
  final int activeScreen;

  @override
  String toString() {
    return 'TabBarState.tabBarIndex(activeScreen: $activeScreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabBarIndexImpl &&
            (identical(other.activeScreen, activeScreen) ||
                other.activeScreen == activeScreen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeScreen);

  /// Create a copy of TabBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabBarIndexImplCopyWith<_$TabBarIndexImpl> get copyWith =>
      __$$TabBarIndexImplCopyWithImpl<_$TabBarIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int activeScreen) tabBarIndex,
  }) {
    return tabBarIndex(activeScreen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int activeScreen)? tabBarIndex,
  }) {
    return tabBarIndex?.call(activeScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int activeScreen)? tabBarIndex,
    required TResult orElse(),
  }) {
    if (tabBarIndex != null) {
      return tabBarIndex(activeScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TabBarIndex value) tabBarIndex,
  }) {
    return tabBarIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TabBarIndex value)? tabBarIndex,
  }) {
    return tabBarIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TabBarIndex value)? tabBarIndex,
    required TResult orElse(),
  }) {
    if (tabBarIndex != null) {
      return tabBarIndex(this);
    }
    return orElse();
  }
}

abstract class TabBarIndex implements TabBarState {
  const factory TabBarIndex({final int activeScreen}) = _$TabBarIndexImpl;

  @override
  int get activeScreen;

  /// Create a copy of TabBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabBarIndexImplCopyWith<_$TabBarIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
