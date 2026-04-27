// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';

import '../interfaces/i_home_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final NetworkService networkService;

  HomeRepository({required this.networkService});

  @override
  Future<Result<HomeResponse>> homeData() async {
    var response = await networkService.getAsync(
      url: AppStrings.urls.homeUrl,
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data['data']}");
    return Result.value(
      HomeResponse.fromJson(response.asValue?.value.data['data']),
    );
  }
}
