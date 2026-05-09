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
  Future<bool> createInvitation(List<SelectedGuest> listGuest) async {
    // var homeData = await _repository.homeData(cityId: citySelected.id,categoryId: state.categorySelected?.id,search: state.searchTerm);
    // if (homeData.isError) {
    //   MessageService.showToast(
    //     msg: homeData.asError?.error.toString() ?? "",
    //     state: ToastStates.error,
    //   );
    //   emit(state.copyWith(currState: Error()));
    //
    //   return false;
    // }
    emit(state.copyWith( currState: Success(),));
    return true;
  }
}
