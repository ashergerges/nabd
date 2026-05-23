import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/features/splash/data/repositories/interfaces/i_splash_repository.dart';
import 'package:nawy/main_common.dart';


part 'splash_cubit.freezed.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
    : _localPreference = getIt<ILocalPreference>(),
      _splashRepository = getIt<ISplashRepository>(),
      super(const SplashState.initial());

  final ILocalPreference _localPreference;
  final ISplashRepository _splashRepository;

  Future<void> init() async {
      await getAppStartUpStatus();
  }



  Future<void> getAppStartUpStatus() async {



    final hasConnection = await InternetConnectionChecker().hasConnection;
    if (!hasConnection) {
      return getIt<AppRouter>().replaceAll([const NoInternetSplashRoute()], updateExistingRoutes: false);
    }
    getIt<AppRouter>().replaceAll([
      _localPreference.appUser.value  !=null? ((_localPreference.appUser.value?.isVendor??false)?ProviderHomeBottomTabsRoute(): HomeBottomTabsRoute()):LoginRoute()
    ], updateExistingRoutes: false);
  }
}
