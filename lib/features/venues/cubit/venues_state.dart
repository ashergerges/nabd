part of 'venues_cubit.dart';

@freezed
class VenuesState with _$VenuesState {
  const factory VenuesState({
    @Default(VenuesStateStatus.initial()) VenuesStateStatus currState,
    @Default([]) List<ProductModel> venuesList,

}) = _VenuesState;
}

@freezed
class VenuesStateStatus with _$VenuesStateStatus {
  const factory VenuesStateStatus.initial() = Initial;
  const factory VenuesStateStatus.loading() = Loading;
  const factory VenuesStateStatus.error() = Error;
  const factory VenuesStateStatus.success() = Success;
}