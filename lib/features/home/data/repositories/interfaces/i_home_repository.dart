// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nawy/features/auth/data/models/login_response_body.dart';
import 'package:nawy/features/home/data/models/home_response.dart';
abstract class IHomeRepository {
  Future<Result<HomeResponse>> homeData({ int? categoryId, int? cityId,String? search ,});

}
