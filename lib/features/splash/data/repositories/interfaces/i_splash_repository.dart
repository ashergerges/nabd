import 'package:async/async.dart';
import 'package:nabd/features/splash/data/models/settings_model.dart';

abstract class ISplashRepository {
  Future<Result<SettingsModel>> support();

}
