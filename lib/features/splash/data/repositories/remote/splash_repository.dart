import 'package:nawy/core/services/network/network_service.dart';
import 'package:nawy/features/common/data/local/models/app_footer.dart';
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/constants/constants.dart';
import '../interfaces/i_splash_repository.dart';

@Injectable(as: ISplashRepository)
class SplashRepository implements ISplashRepository {
  final NetworkService networkService;

  SplashRepository({required this.networkService});


}
