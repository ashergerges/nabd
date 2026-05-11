import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/profile/data/repositories/interfaces/i_update_profile_repository.dart';

import '../../../../main_common.dart';

part 'update_profile_state.dart';
part 'update_profile_cubit.freezed.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() :
        _repository=getIt<IUpdateProfileRepository>(),
        super( UpdateProfileState(
        name: getIt<ILocalPreference>().appUser.value?.name,
        phone: getIt<ILocalPreference>().appUser.value?.phone,
        address: getIt<ILocalPreference>().appUser.value?.address,
      ));

  final IUpdateProfileRepository _repository;

  void setName(String? value){
    emit(state.copyWith(name:value));
  }
  void setPhone(String? value){
    emit(state.copyWith(phone:value));
  }
  void setAddress(String? value){
    emit(state.copyWith(address:value));
  }
  bool hasChanges() {
    final currentUser = getIt<ILocalPreference>().appUser.value;
    return state.name != currentUser?.name ||
        state.phone != currentUser?.phone ||
        state.address != currentUser?.address;
  }
  Future<void> updateProfileDate() async {
    emit(state.copyWith(currState:Loading(),));
    var updateProfileDate = await _repository.updateProfileDate(address:state.address,phone:state.phone,name:state.name,);
    if (updateProfileDate.isError) {
      MessageService.showToast(
        msg: updateProfileDate.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    getIt<ILocalPreference>().saveAppUser(
        getIt<ILocalPreference>().appUser.value?.copyWith(
          image: updateProfileDate.asValue?.value.image,
          phone: updateProfileDate.asValue?.value.phone,
          name: updateProfileDate.asValue?.value.name,
          address: updateProfileDate.asValue?.value.address,
        )
    );
    emit(state.copyWith( currState: Success(), ));
  }

  Future<void> updateProfileImage({required String path}) async {
    emit(state.copyWith(currState:Loading(),));
    var updateProfileImage = await _repository.updateProfileImage(path: path);
    if (updateProfileImage.isError) {
      MessageService.showToast(
        msg: updateProfileImage.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    getIt<ILocalPreference>().saveAppUser(
      getIt<ILocalPreference>().appUser.value?.copyWith(
        image: updateProfileImage.asValue?.value.image,
        phone: updateProfileImage.asValue?.value.phone,
        name: updateProfileImage.asValue?.value.name,
        address: updateProfileImage.asValue?.value.address,
      )
    );
    emit(state.copyWith( currState: Success(), ));
  }
}
