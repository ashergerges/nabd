// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
abstract class ILoginRepository {
  Future<Result<bool>> loginAsync({required String phone});
  Future<Result<bool>> reSendOTP({required String phone});
  Future<Result<String>> validateOtp({
    required String phone,
    required String otp,
  });
}
