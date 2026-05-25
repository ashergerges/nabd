import 'package:nawy/features/common/data/local/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:nawy/features/splash/data/models/settings_model.dart';

import '../../features/common/data/local/models/app_footer.dart';

abstract class ILocalPreference {
  late final ValueNotifier<AppUser?> appUser;
  late final ValueNotifier<SettingsModel?> support;

  void initialize();

  void saveAppUser(AppUser? newAppUser);

  void saveSupport(SettingsModel? support);

  void updateAppUser(AppUser? newAppUser);


  bool? get skipIntro;

  set skipIntro(bool? skipIntro);


  Future<bool?> clear();

  Future<void> removeAuthPrefs();
}
