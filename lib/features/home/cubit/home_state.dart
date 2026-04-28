part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStateStatus.initial()) HomeStateStatus currState,
    HomeResponse? homeData,
    CityModel? citySelected,
    FilterChipModel? categorySelected,
    String? searchTerm,
    @Default(false) bool showSearch,

    required RefreshController refreshController,
}) = _HomeState;
}
@freezed
class HomeStateStatus with _$HomeStateStatus {
  const factory HomeStateStatus.initial() = Initial;
  const factory HomeStateStatus.loading() = Loading;
  const factory HomeStateStatus.error() = Error;
  const factory HomeStateStatus.success() = Success;
}