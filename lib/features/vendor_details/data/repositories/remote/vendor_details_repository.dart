// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/vendor_details/data/models/package_details_model.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';

import '../interfaces/i_vendor_details_repository.dart';

@Injectable(as: IVendorDetailsRepository)
class VendorDetailsRepository implements IVendorDetailsRepository {
  final NetworkService networkService;

  VendorDetailsRepository({required this.networkService});

  @override
  Future<Result<VendorDetailsModel>> vendorDetails({required int id})async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.vendorDetailsUrl,
      queryParameters: {
        "id":id
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['product']}");

    return Result.value(
      VendorDetailsModel.fromJson(response.asValue?.value.data['data']['product']),

    );
  }
  @override
  Future<Result<PackageDetailsModel>> packageDetails({required int id})async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.packageDetailsUrl,
      queryParameters: {
        "package_id":id
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['package']}");

    return Result.value(
      PackageDetailsModel.fromJson(response.asValue?.value.data['data']['package']),

    );
  }
  @override
  Future<Result<bool>> wishlistVendor({required int id})async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.wishlistToggleUrl,
      queryParameters: {
        "id":id,
        "type":1,
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['product']}");

    return Result.value(true);
  }
  @override
  Future<Result<PackageDetailsModel>> wishlistPackage({required int id})async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.wishlistToggleUrl,
      queryParameters: {
        "id":id,
        "type":2,
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['wishlist']['package']}");

    return Result.value(PackageDetailsModel.fromJson(response.asValue?.value.data['data']['wishlist']['package']));
  }
}
