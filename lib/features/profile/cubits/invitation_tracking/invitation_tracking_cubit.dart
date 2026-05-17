import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
import 'package:nawy/features/profile/data/models/invitation_tracking/invitation_model.dart';
import 'package:nawy/features/profile/data/repositories/interfaces/i_invitation_tracking_repository.dart';
import 'package:nawy/main_common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'invitation_tracking_state.dart';
part 'invitation_tracking_cubit.freezed.dart';

class InvitationTrackingCubit extends Cubit<InvitationTrackingState> {
  InvitationTrackingCubit() :
        _repository=getIt<IInvitationTrackingRepository>(),
        super( InvitationTrackingState(refreshController:RefreshController()));

  final IInvitationTrackingRepository _repository;

  Future<bool> addedGuest({required List<SelectedGuest> listGuest,required int invitationId}) async {
    emit(state.copyWith(currState: Loading()));
    var addedGuest = await _repository.addedGuest(invitationId:invitationId ,listGuest: listGuest,);
    if (addedGuest.isError) {
      MessageService.showToast(
        msg: addedGuest.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return false;
    }

    final invitationData = addedGuest.asValue?.value;
    final guests = invitationData?.guests ?? [];

    // Filter guests by status
    final acceptedList = guests.where((g) => g.status == 1).toList();
    final pendingList = guests.where((g) => g.status == 0).toList();
    final rejectedList = guests.where((g) => g.status == 2).toList();

    // Calculate summary data
    final totalInvited = guests.length;
    final acceptedCount = acceptedList.length;
    final waitingCount = pendingList.length;
    final rejectedCount = rejectedList.length;
    final progressPercent = totalInvited > 0
        ? (acceptedCount + rejectedCount) / totalInvited
        : 0.0;

    emit(state.copyWith(
      currState: Success(),
      invitationData: invitationData,
      acceptedList: acceptedList,
      pendingList: pendingList,
      rejectedList: rejectedList,
      totalInvited: totalInvited,
      progressPercent: progressPercent,
      waitingCount: waitingCount,
      acceptedCount: acceptedCount,
      rejectedCount: rejectedCount,
    ));
return true;
  }
  Future<bool> invitation({int? bookingId}) async {
    emit(state.copyWith(currState: Loading()));
    var invitation = await _repository.invitation(bookingId: bookingId);

    if (invitation.isError) {
      MessageService.showToast(
        msg: invitation.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return false;
    }

    final invitationData = invitation.asValue?.value;
    final guests = invitationData?.guests ?? [];

    // Filter guests by status
    final acceptedList = guests.where((g) => g.status == 1).toList();
    final pendingList = guests.where((g) => g.status == 0).toList();
    final rejectedList = guests.where((g) => g.status == 2).toList();

    // Calculate summary data
    final totalInvited = guests.length;
    final acceptedCount = acceptedList.length;
    final waitingCount = pendingList.length;
    final rejectedCount = rejectedList.length;
    final progressPercent = totalInvited > 0
        ? (acceptedCount + rejectedCount) / totalInvited
        : 0.0;

    emit(state.copyWith(
      currState: Success(),
      invitationData: invitationData,
      acceptedList: acceptedList,
      pendingList: pendingList,
      rejectedList: rejectedList,
      totalInvited: totalInvited,
      progressPercent: progressPercent,
      waitingCount: waitingCount,
      acceptedCount: acceptedCount,
      rejectedCount: rejectedCount,
    ));

    return true;
  }
}
