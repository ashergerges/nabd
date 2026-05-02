part of 'fav_cubit.dart';

@freezed
class FavState with _$FavState {
  const factory FavState({
    @Default(FavStateStatus.initial()) FavStateStatus currState,
    required RefreshController refreshPackageController,
    required RefreshController refreshVendorController,
    @Default([]) List<FavVendorModel> favVendors,
    @Default([]) List<FavPackageModel> favPackages,

  }) = _FavState;
}
@freezed
class FavStateStatus with _$FavStateStatus {
  const factory FavStateStatus.initial() = Initial;
  const factory FavStateStatus.loading() = Loading;
  const factory FavStateStatus.error() = Error;
  const factory FavStateStatus.success() = Success;
}
