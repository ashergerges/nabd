// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
import 'package:nawy/features/venues/data/models/product_model.dart';

import '../interfaces/i_venues_repository.dart';

@Injectable(as: IVenuesRepository)
class VenuesRepository implements IVenuesRepository {
  final NetworkService networkService;

  VenuesRepository({required this.networkService});

  @override
  Future<Result<List<ProductModel>>> venues({required int categoryId,String? search,String? date,num? minPrice,num? maxPrice,} ) async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.venuesUrl,
      queryParameters: {
        "category_id":categoryId,
        if(search!=null&&search.isNotEmpty)"search":search,
        if(minPrice!=null)"min_price":minPrice,
        if(maxPrice!=null)"max_price":maxPrice,
        if(date!=null)"date":date,
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['products']}");
    List<ProductModel> categories = List<ProductModel>.from(
        response.asValue?.value.data['data']['products'].map((x) => ProductModel.fromJson(x)));

    return Result.value(categories
    );
  }
}
