import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/categories/data/models/category_model.dart';
import 'package:nawy/features/categories/data/repositories/interfaces/i_categories_repository.dart';
import 'package:nawy/main_common.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() :
        _repository=getIt<ICategoriesRepository>(),

        super(const CategoriesState());
  final ICategoriesRepository _repository;

  void setShowedSearch(bool showSearch){
    emit(state.copyWith(isShowSearch: showSearch,));
  }
  Future<void> setSearchTerm(String? searchTerm) async {
    emit(state.copyWith(searchTerm:searchTerm));
    var categories = await _repository.categories(search:searchTerm);
    if (categories.isError) {
      MessageService.showToast(
        msg: categories.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),categoriesList:categories.asValue?.value??[],));
  }

  Future<void> categories() async {
    emit(state.copyWith(currState: Loading()));

    var categories = await _repository.categories();
    if (categories.isError) {
      MessageService.showToast(
        msg: categories.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return;
    }
    emit(state.copyWith( currState: Success(),categoriesList:categories.asValue?.value??[]));
    return;
  }
}
