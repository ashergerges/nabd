part of 'update_profile_cubit.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState({
    @Default(UpdateProfileStateStatus.initial()) UpdateProfileStateStatus currState,
    String?name,
    String?phone,
    String?address,
  }) = _UpdateProfileState;
}
@freezed
class UpdateProfileStateStatus with _$UpdateProfileStateStatus {
  const factory UpdateProfileStateStatus.initial() = Initial;
  const factory UpdateProfileStateStatus.loading() = Loading;
  const factory UpdateProfileStateStatus.error() = Error;
  const factory UpdateProfileStateStatus.success() = Success;
}