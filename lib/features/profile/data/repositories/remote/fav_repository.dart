// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';

import '../interfaces/i_fav_repository.dart';

@Injectable(as: IFavRepository)
class FavRepository implements IFavRepository {
  final NetworkService networkService;

  FavRepository({required this.networkService});
  @override
  Future<Result<List<ProductModel>>> getWishlistVendor()async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.wishlistTypeUrl,
        queryParameters: {
          "type":1,
        }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    List<ProductModel> venues = List<ProductModel>.from(
        response.asValue?.value.data['data']['products'].map((x) => ProductModel.fromJson(x)));

    return Result.value(venues

    );
  }
  @override
  Future<Result<List<ProductModel>>> getWishlistPackage()async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.wishlistTypeUrl,
        queryParameters: {

          "type":2,
        }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    List<ProductModel> venues = List<ProductModel>.from(
        response.asValue?.value.data['data']['products'].map((x) => ProductModel.fromJson(x)));

    return Result.value(venues

    );
  }
  @override
  Future<Result<VendorDetailsModel>> wishlistVendor({required int id})async {
    var response = await networkService.postAsync(
        url: AppStrings.urls.wishlistToggleUrl,
        body: {
          "id":id,
          "type":1,
        }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");

    return Result.value(
      VendorDetailsModel.fromJson(response.asValue?.value.data['data']),

    );
  }
  @override
  Future<Result<VendorDetailsModel>> wishlistPackage({required int id})async {
    var response = await networkService.postAsync(
        url: AppStrings.urls.wishlistToggleUrl,
        body: {
          "id":id,
          "type":2,
        }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");

    return Result.value(
      VendorDetailsModel.fromJson(response.asValue?.value.data['data']),

    );
  }
}
