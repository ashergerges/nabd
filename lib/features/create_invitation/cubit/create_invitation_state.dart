part of 'create_invitation_cubit.dart';

@freezed
class CreateInvitationState with _$CreateInvitationState {
  const factory CreateInvitationState({
    @Default(CreateInvitationStateStatus.initial()) CreateInvitationStateStatus currState,
    String? nameBride,
    String? nameGroom,
}) = _CreateInvitationState;
}
@freezed
class CreateInvitationStateStatus with _$CreateInvitationStateStatus {
  const factory CreateInvitationStateStatus.initial() = Initial;
  const factory CreateInvitationStateStatus.loading() = Loading;
  const factory CreateInvitationStateStatus.error() = Error;
  const factory CreateInvitationStateStatus.success() = Success;
}