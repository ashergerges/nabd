import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/home/data/repositories/interfaces/i_home_repository.dart';
import 'package:nawy/main_common.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :
        _repository=getIt<IHomeRepository>(),
        super(const HomeState());

  final IHomeRepository _repository;

  Future<void> homeData() async {
    emit(state.copyWith(currState: Loading()));

    var homeData = await _repository.homeData();
    if (homeData.isError) {
      MessageService.showToast(
        msg: homeData.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),homeData:homeData.asValue?.value));
    return;
  }

}
