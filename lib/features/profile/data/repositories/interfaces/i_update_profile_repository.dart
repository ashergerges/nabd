// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

import '../../../../common/data/local/models/app_user.dart';
abstract class IUpdateProfileRepository {
  Future<Result<AppUser>> updateProfileImage({required String path});
  Future<Result<AppUser>> updateProfileDate({String? name,String? phone,String? address,});


}
