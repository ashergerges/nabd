import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/profile/data/repositories/interfaces/i_fav_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../main_common.dart';

part 'fav_state.dart';
part 'fav_cubit.freezed.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() :
        _repository=getIt<IFavRepository>(),
        super( FavState(refreshController:RefreshController() ));

  final IFavRepository _repository;
  Future<void> getWishlistVendor() async {
    log("Asher::");
    emit(state.copyWith(currState:Loading()));
    var wishlistVendor = await _repository.getWishlistVendor();
    if (wishlistVendor.isError) {
      MessageService.showToast(
        msg: wishlistVendor.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),));
  }  Future<void> getWishlistPackage() async {
    emit(state.copyWith(currState:Loading()));
    var wishlistPackage = await _repository.getWishlistPackage();
    if (wishlistPackage.isError) {
      MessageService.showToast(
        msg: wishlistPackage.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),));
  }

}
