// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/interfaces/i_connection_service.dart' as _i952;
import 'core/interfaces/i_local_preference.dart' as _i865;
import 'core/interfaces/i_token_local_repository.dart' as _i735;
import 'core/interfaces/i_token_repository.dart' as _i892;
import 'core/router/app_router.dart' as _i110;
import 'core/services/alice/alice_service.dart' as _i854;
import 'core/services/dialogs/message_service.dart' as _i392;
import 'core/services/network/connection_service.dart' as _i943;
import 'core/services/network/interceptors/auth_interceptor.dart' as _i202;
import 'core/services/network/network_service.dart' as _i969;
import 'core/services/network/token_service.dart' as _i797;
import 'core/services/notification/notifications_service.dart' as _i402;
import 'core/services/upgrader/upgrader_service.dart' as _i289;
import 'core/utils/helper/error_handler.dart' as _i785;
import 'features/auth/data/repositories/interfaces/i_login_repository.dart'
    as _i377;
import 'features/auth/data/repositories/remote/login_repository.dart' as _i286;
import 'features/book/data/repositories/interfaces/i_book_repository.dart'
    as _i448;
import 'features/book/data/repositories/remote/book_repository.dart' as _i290;
import 'features/categories/data/repositories/interfaces/i_categories_repository.dart'
    as _i443;
import 'features/categories/data/repositories/remote/categories_repository.dart'
    as _i279;
import 'features/common/data/local/data_sources/local_storage.dart' as _i656;
import 'features/common/data/local/repositories/token_local_repository.dart'
    as _i784;
import 'features/common/data/local/repositories/token_repository.dart' as _i723;
import 'features/common/data/repositories/interfaces/i_main_repository.dart'
    as _i967;
import 'features/common/data/repositories/remote/main_repository.dart' as _i210;
import 'features/create_invitation/data/repositories/interfaces/i_create_invitation_repository.dart'
    as _i733;
import 'features/create_invitation/data/repositories/remote/create_invitation_repository.dart'
    as _i885;
import 'features/home/data/repositories/interfaces/i_home_repository.dart'
    as _i185;
import 'features/home/data/repositories/remote/home_repository.dart' as _i975;
import 'features/my_booking/data/repositories/interfaces/i_my_booking_repository.dart'
    as _i370;
import 'features/my_booking/data/repositories/remote/my_booking_repository.dart'
    as _i851;
import 'features/notifications/data/repositories/interfaces/i_notifications_repository.dart'
    as _i97;
import 'features/notifications/data/repositories/remote/notifications_repository.dart'
    as _i192;
import 'features/profile/data/repositories/interfaces/i_fav_repository.dart'
    as _i814;
import 'features/profile/data/repositories/interfaces/i_update_profile_repository.dart'
    as _i46;
import 'features/profile/data/repositories/remote/fav_repository.dart' as _i280;
import 'features/profile/data/repositories/remote/update_profile_repository.dart'
    as _i269;
import 'features/splash/cubits/splash_cubit/splash_cubit.dart' as _i331;
import 'features/splash/data/repositories/interfaces/i_splash_repository.dart'
    as _i561;
import 'features/splash/data/repositories/remote/splash_repository.dart'
    as _i120;
import 'features/vendor_details/data/repositories/interfaces/i_vendor_details_repository.dart'
    as _i283;
import 'features/vendor_details/data/repositories/remote/vendor_details_repository.dart'
    as _i1037;
import 'features/venues/data/repositories/interfaces/i_venues_repository.dart'
    as _i302;
import 'features/venues/data/repositories/remote/venues_repository.dart'
    as _i665;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.factory<_i331.SplashCubit>(() => _i331.SplashCubit());
  gh.singleton<_i110.AppRouter>(() => _i110.AppRouter());
  gh.singleton<_i854.AliceService>(() => _i854.AliceService());
  gh.singleton<_i392.MessageService>(() => _i392.MessageService());
  gh.singleton<_i785.ErrorHandler>(() => _i785.ErrorHandler());
  gh.factory<_i289.IUpGraderService>(() => _i289.UpGraderService());
  gh.singleton<_i952.IConnectionService>(() => _i943.ConnectionService());
  gh.singleton<_i865.ILocalPreference>(() => _i656.LocalPreferenceImpl());
  gh.singleton<_i735.ITokenLocalRepository>(
    () => _i784.TokenLocalRepository(
      localPreference: gh<_i865.ILocalPreference>(),
    ),
  );
  gh.singleton<_i892.ITokenRepository>(
    () => _i723.TokenRepository(localPreference: gh<_i865.ILocalPreference>()),
  );
  gh.singleton<_i797.TokenService>(
    () => _i797.TokenService(
      tokenRepository: gh<_i892.ITokenRepository>(),
      tokenLocalRepository: gh<_i735.ITokenLocalRepository>(),
    ),
  );
  gh.singleton<_i202.AuthInterceptor>(
    () => _i202.AuthInterceptor(gh<_i797.TokenService>()),
  );
  gh.singleton<_i969.NetworkService>(
    () => _i969.NetworkService(
      tokenService: gh<_i797.TokenService>(),
      aliceService: gh<_i854.AliceService>(),
    ),
  );
  gh.factory<_i967.IMainRepository>(
    () => _i210.MainRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i733.ICreateInvitationRepository>(
    () => _i885.CreateInvitationRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i561.ISplashRepository>(
    () => _i120.SplashRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i283.IVendorDetailsRepository>(
    () => _i1037.VendorDetailsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i97.INotificationsRepository>(
    () => _i192.NotificationsRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i302.IVenuesRepository>(
    () => _i665.VenuesRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i443.ICategoriesRepository>(
    () =>
        _i279.CategoriesRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i448.IBookRepository>(
    () => _i290.BookRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.singleton<_i402.NotificationService>(
    () => _i402.NotificationService(
      notificationsRepository: gh<_i97.INotificationsRepository>(),
      localePreference: gh<_i865.ILocalPreference>(),
    ),
  );
  gh.factory<_i370.IMyBookingRepository>(
    () => _i851.MyBookingRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i46.IUpdateProfileRepository>(
    () => _i269.UpdateProfileRepository(
      networkService: gh<_i969.NetworkService>(),
    ),
  );
  gh.factory<_i185.IHomeRepository>(
    () => _i975.HomeRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i814.IFavRepository>(
    () => _i280.FavRepository(networkService: gh<_i969.NetworkService>()),
  );
  gh.factory<_i377.ILoginRepository>(
    () => _i286.LoginRepository(networkService: gh<_i969.NetworkService>()),
  );
  return getIt;
}
