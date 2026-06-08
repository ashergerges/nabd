// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:nabd/features/auth/data/models/login_response_body.dart';
import 'package:nabd/features/home/data/models/home_response.dart';
abstract class IHomeRepository {
  Future<Result<HomeResponse>> homeData({ int? categoryId, int? cityId,String? search ,});

}
