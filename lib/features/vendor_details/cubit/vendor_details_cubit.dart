import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/vendor_details/data/models/package_details_model.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';
import 'package:nawy/features/vendor_details/data/repositories/interfaces/i_vendor_details_repository.dart';
import 'package:nawy/main_common.dart';

part 'vendor_details_state.dart';
part 'vendor_details_cubit.freezed.dart';

class VendorDetailsCubit extends Cubit<VendorDetailsState> {
  VendorDetailsCubit() :
        _repository=getIt<IVendorDetailsRepository>(),

      super(const VendorDetailsState());
  final IVendorDetailsRepository _repository;

  Future<void> vendorDetails(int id) async {
    emit(state.copyWith(currState: Loading()));

    var vendorDetails = await _repository.vendorDetails(id:id );
    if (vendorDetails.isError) {
      MessageService.showToast(
        msg: vendorDetails.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),vendorDetails:vendorDetails.asValue?.value));
    return;
  }
  Future<void> packageDetails(int id) async {
    emit(state.copyWith(currState: Loading()));

    var packageDetails = await _repository.packageDetails(id:id );
    if (packageDetails.isError) {
      MessageService.showToast(
        msg: packageDetails.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),packageDetails:packageDetails.asValue?.value));
    return;
  }
  Future<bool> wishlistVendor(int id) async {
    emit(state.copyWith(currState: Loading()));

    var wishlistVendor = await _repository.wishlistVendor(id: id);
    if (wishlistVendor.isError) {
      MessageService.showToast(
        msg: wishlistVendor.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return false;
    }
    return true;
  }Future<bool> wishlistPackage(int id) async {
    emit(state.copyWith(currState: Loading()));

    var wishlistPackage = await _repository.wishlistPackage(id: id);
    if (wishlistPackage.isError) {
      MessageService.showToast(
        msg: wishlistPackage.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return false;
    }
    emit(state.copyWith( currState: Success(),packageDetails:state.packageDetails?.copyWith(
      isFavorite: wishlistPackage.asValue?.value.isFavorite
    )));

    return true;
  }

}
