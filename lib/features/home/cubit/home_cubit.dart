import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nabd/core/services/dialogs/message_service.dart';
import 'package:nabd/features/home/data/models/city_model.dart';
import 'package:nabd/features/home/data/models/filter_chip_model.dart';
import 'package:nabd/features/home/data/models/home_response.dart';
import 'package:nabd/features/home/data/repositories/interfaces/i_home_repository.dart';
import 'package:nabd/main_common.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :
        _repository=getIt<IHomeRepository>(),
        super( HomeState(refreshController:RefreshController()));

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
    emit(state.copyWith( currState: Success(),homeData:homeData.asValue?.value,));
    return;
  }

  Future<void> selectedCategory(FilterChipModel categorySelected) async {
    emit(state.copyWith( categorySelected:categorySelected));
    var homeData = await _repository.homeData(cityId: state.citySelected?.id,categoryId: categorySelected.id,search: state.searchTerm);
    if (homeData.isError) {
      MessageService.showToast(
        msg: homeData.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),homeData:homeData.asValue?.value,));
  }
  Future<void> selectedLocation(CityModel citySelected) async {
    emit(state.copyWith(citySelected:citySelected));
    var homeData = await _repository.homeData(cityId: citySelected.id,categoryId: state.categorySelected?.id,search: state.searchTerm);
    if (homeData.isError) {
      MessageService.showToast(
        msg: homeData.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),homeData:homeData.asValue?.value,));
  }
  void setShowedSearch(bool showSearch){
    emit(state.copyWith(showSearch: showSearch));
  }
  Future<void> setSearchTerm(String? searchTerm) async {
    emit(state.copyWith(searchTerm:searchTerm));
    var homeData = await _repository.homeData(cityId: state.citySelected?.id,categoryId: state.categorySelected?.id,search:searchTerm);
    if (homeData.isError) {
      MessageService.showToast(
        msg: homeData.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),homeData:homeData.asValue?.value,));
  }


}
