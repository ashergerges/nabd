part of 'vendor_details_cubit.dart';

@freezed
class VendorDetailsState with _$VendorDetailsState {
  const factory VendorDetailsState({
    VendorDetailsModel? vendorDetails,
  @Default(VendorDetailsStateStatus.initial()) VendorDetailsStateStatus currState,

}) = _VendorDetailsState;
}

@freezed
class VendorDetailsStateStatus with _$VendorDetailsStateStatus {
  const factory VendorDetailsStateStatus.initial() = Initial;
  const factory VendorDetailsStateStatus.loading() = Loading;
  const factory VendorDetailsStateStatus.error() = Error;
  const factory VendorDetailsStateStatus.success() = Success;
}