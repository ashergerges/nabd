// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/categories/data/models/category_model.dart';

import '../interfaces/i_categories_repository.dart';

@Injectable(as: ICategoriesRepository)
class CategoriesRepository implements ICategoriesRepository {
  final NetworkService networkService;

  CategoriesRepository({required this.networkService});

  @override
  Future<Result<List<CategoryModel>>> categories({ String? search}) async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.categoriesUrl,
      queryParameters: {
        if(search!=null)"search":search
      }
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']['categories']}");
    List<CategoryModel> categories = List<CategoryModel>.from(
        response.asValue?.value.data['data']['categories'].map((x) => CategoryModel.fromJson(x)));

    return Result.value(categories
    );
  }
}
