// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';

import '../interfaces/i_login_repository.dart';

@Injectable(as: ILoginRepository)
class LoginRepository implements ILoginRepository {
  final NetworkService networkService;

  LoginRepository({required this.networkService});

  @override
  Future<Result<bool>> loginAsync({required String phone}) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.loginUrl,
      body: {"phone": phone},
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22!!${response.asValue?.value.data}");
    return Result.value(true);
  }

  @override
  Future<Result<bool>> reSendOTP({required String phone}) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.reSendOTPUrl,
      body: {"phone": phone},
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22${response.asValue}");
    return Result.value(true);
  }

  @override
  Future<Result<String>> validateOtp({
    required String phone,
    required String otp,
  }) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.validateOTPUrl,
      body: {
        "phone": phone,
        "otp": otp,
        "device_token": "await FirebaseMessaging.instance.getToken()",

      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22${response.asValue?.value.data}");
    return Result.value(
      "LoginResponseBody.fromJson(response.asValue?.value.data)",
    );
  }

}
