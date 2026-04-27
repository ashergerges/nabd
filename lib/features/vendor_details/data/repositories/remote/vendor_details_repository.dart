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

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['products']}");

    return Result.value(
      VendorDetailsModel.fromJson(response.asValue?.value.data['data']),

    );
  }
}
