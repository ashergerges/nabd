part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(CategoriesStateStatus.initial()) CategoriesStateStatus currState,
    @Default([]) List<CategoryModel> categoriesList,

}) = _CategoriesState;
}
@freezed
class CategoriesStateStatus with _$CategoriesStateStatus {
  const factory CategoriesStateStatus.initial() = Initial;
  const factory CategoriesStateStatus.loading() = Loading;
  const factory CategoriesStateStatus.error() = Error;
  const factory CategoriesStateStatus.success() = Success;
}