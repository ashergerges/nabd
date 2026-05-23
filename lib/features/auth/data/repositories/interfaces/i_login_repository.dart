// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
abstract class ILoginRepository {
  Future<Result<bool>> loginAsync({required String phone});
  Future<Result<bool>> signUpAsync({required String phone,required String name,required int categoryId,});
  Future<Result<bool>> reSendOTP({required String phone});
  Future<Result<LoginResponseBody>> validateOtp({
    required String phone,
    required String otp,
  });
}
