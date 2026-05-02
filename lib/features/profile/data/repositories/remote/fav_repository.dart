// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/profile/data/models/fav/fav_package_model.dart';
import 'package:nawy/features/profile/data/models/fav/fav_vendor_model.dart';
import 'package:nawy/features/vendor_details/data/models/vendor_details_model.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';

import '../interfaces/i_fav_repository.dart';

@Injectable(as: IFavRepository)
class FavRepository implements IFavRepository {
  final NetworkService networkService;

  FavRepository({required this.networkService});
  @override
  Future<Result<List<FavVendorModel>>> getWishlistVendor()async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.wishlistTypeUrl,
        queryParameters: {
          "type":1,
        }
    );
    if (response.isError) return Result.error(response.asError!.error);

    final data = response.asValue?.value.data['data'];

    final List list = data['wishlist'] ?? [];

    List<FavVendorModel> venues = list
        .map((item) => item['product'])
        .where((product) => product != null)
        .map<FavVendorModel>((product) => FavVendorModel.fromJson(product))
        .toList();

    return Result.value(venues);
  }
  @override
  Future<Result<List<FavPackageModel>>> getWishlistPackage()async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.wishlistTypeUrl,
        queryParameters: {

          "type":2,
        }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    final data = response.asValue?.value.data['data'];

    final List list = data['wishlist'] ?? [];

    List<FavPackageModel> packages = list
        .map((item) => item['package'])
        .where((package) => package != null)
        .map<FavPackageModel>((package) => FavPackageModel.fromJson(package))
        .toList();

    return Result.value(packages);
  }
}
