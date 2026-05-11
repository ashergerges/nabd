// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/features/common/data/local/models/app_user.dart';
import 'package:nawy/features/profile/data/repositories/interfaces/i_update_profile_repository.dart';

@Injectable(as: IUpdateProfileRepository)
class UpdateProfileRepository implements IUpdateProfileRepository {
  final NetworkService networkService;

  UpdateProfileRepository({required this.networkService});

  @override
  Future<Result<AppUser>> updateProfileImage({required String path}) async {
    var response = await networkService.postMultiPartFormDataAsync(
      url: AppStrings.urls.updateProfileImageUrl,
      formMap: {"image": await MultipartFile.fromFile(path)},
    );
    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(
        AppUser.fromJson(response.asValue?.value.data['data']['user'])
    );
  }

  @override
  Future<Result<AppUser>> updateProfileDate({
    String? name,
    String? phone,
    String? address,
  }) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.updateProfileUrl,
      body: {
        if (name != null) "name": name,
        if (phone != null) "phone": phone,
        if (address != null) "address": address,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(
        AppUser.fromJson(response.asValue?.value.data['data']['user'])
    );
  }
}
