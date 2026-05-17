part of 'invitation_tracking_cubit.dart';

@freezed
class InvitationTrackingState with _$InvitationTrackingState {
  const factory InvitationTrackingState({
    InvitationModel? invitationData,
    @Default([]) List<InvitationGuestModel> acceptedList,
    @Default([]) List<InvitationGuestModel> pendingList,
    @Default([]) List<InvitationGuestModel> rejectedList,
    @Default(0) int totalInvited,
    @Default(0.0) double progressPercent,
    @Default(0) int waitingCount,
    @Default(0) int acceptedCount,
    @Default(0) int rejectedCount,
    @Default(InvitationTrackingStateStatus.initial()) InvitationTrackingStateStatus currState,
    required RefreshController refreshController,
  }) = _InvitationTrackingState;
}
@freezed
class InvitationTrackingStateStatus with _$InvitationTrackingStateStatus {
  const factory InvitationTrackingStateStatus.initial() = Initial;
  const factory InvitationTrackingStateStatus.loading() = Loading;
  const factory InvitationTrackingStateStatus.error() = Error;
  const factory InvitationTrackingStateStatus.success() = Success;
}
