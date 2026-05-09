part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    String? phone,
    @Default('')  String oTPCode,
    @Default(false)  bool refresh,
    @Default(false)  bool resendCode,
      required GlobalKey<FormState> formKey,
    @Default(AuthStateStatus.initial()) AuthStateStatus currState,
}) = _AuthState;
}
@freezed
class AuthStateStatus with _$AuthStateStatus {
  const factory AuthStateStatus.initial() = Initial;
  const factory AuthStateStatus.loading() = Loading;
  const factory AuthStateStatus.error() = Error;
  const factory AuthStateStatus.success() = Success;
}