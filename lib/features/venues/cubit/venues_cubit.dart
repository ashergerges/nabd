import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';
import 'package:nawy/features/venues/data/repositories/interfaces/i_venues_repository.dart';
import 'package:nawy/main_common.dart';

part 'venues_state.dart';
part 'venues_cubit.freezed.dart';

class VenuesCubit extends Cubit<VenuesState> {
  VenuesCubit() :
        _repository=getIt<IVenuesRepository>(),
        super(const VenuesState());

  final IVenuesRepository _repository;


  Future<void> venues(int categoryId) async {
    emit(state.copyWith(currState: Loading()));

    var venues = await _repository.venues(categoryId:categoryId );
    if (venues.isError) {
      MessageService.showToast(
        msg: venues.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),venuesList:venues.asValue?.value??[]));
    return;
  }
}
