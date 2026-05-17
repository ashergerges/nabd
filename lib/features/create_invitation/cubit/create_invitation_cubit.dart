import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/create_invitation/data/models/selected_guest.dart';
import 'package:nawy/features/create_invitation/data/repositories/interfaces/i_create_invitation_repository.dart';
import 'package:nawy/main_common.dart';

part 'create_invitation_state.dart';
part 'create_invitation_cubit.freezed.dart';

class CreateInvitationCubit extends Cubit<CreateInvitationState> {
  CreateInvitationCubit() :
        _repository=getIt<ICreateInvitationRepository>(),
        super(const CreateInvitationState());
  final ICreateInvitationRepository _repository;

  void setNameGroom(String? value){
    emit(state.copyWith(nameGroom: value));
  }
  void setNameBride(String? value){
    emit(state.copyWith(nameBride: value));
  }
  Future<bool> createInvitation({required List<SelectedGuest> listGuest,required int bookingId}) async {
    var createInvitation = await _repository.createInvitation(bookingId:bookingId ,nameGroom:state.nameGroom??"" ,listGuest: listGuest,nameBride: state.nameBride??"");
    if (createInvitation.isError) {
      MessageService.showToast(
        msg: createInvitation.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return false;
    }
    MessageService.showToast(
      msg: createInvitation.asValue?.value??"",
      state: ToastStates.success,
    );
    emit(state.copyWith( currState: Success(),));
    return true;
  }
}
