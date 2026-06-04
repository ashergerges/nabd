import 'package:auto_route/auto_route.dart';
import 'package:nawy/core/services/ui/offline_internet_screen.dart';
import 'package:nawy/core/services/ui/server_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nawy/features/auth/ui/signup_screen.dart';
import 'package:nawy/features/auth/ui/verification_screen.dart';
import 'package:nawy/features/book/data/model/book_confirmation_model.dart';
import 'package:nawy/features/book/data/model/book_screen_model.dart';
import 'package:nawy/features/book/ui/book_screen.dart';
import 'package:nawy/features/book/ui/booking_confirmation_screen.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
import 'package:nawy/features/my_booking/ui/view_booking_details_screen.dart';
import 'package:nawy/features/categories/data/models/service_category_model.dart';
import 'package:nawy/features/create_invitation/ui/create_invitation_screen.dart';
import 'package:nawy/features/notification/ui/notification_screen.dart';
import 'package:nawy/features/profile/ui/fav_screen.dart';
import 'package:nawy/features/profile/ui/invitation_tracking_screen.dart';
import 'package:nawy/features/profile/ui/language_screen.dart';
import 'package:nawy/features/profile/ui/location_screen.dart';
import 'package:nawy/features/profile/ui/update_profile_screen.dart';
import 'package:nawy/features/provider/provider_tabs/ui/provider_home_bottom_tabs_screen.dart';
import 'package:nawy/features/splash/ui/no_internet_splash.dart';
import 'package:nawy/features/Tabs/ui/home_bottom_tabs_screen.dart';
import 'package:nawy/features/splash/ui/splash_screen.dart';
import 'package:nawy/features/vendor_details/ui/vendor_details_screen.dart';
import 'package:nawy/features/vendor_details/ui/vendor_package_details_screen.dart';
import 'package:nawy/features/venues/ui/venues_screen.dart';
import '../../features/auth/ui/login_screen.dart';
import '../../features/profile/ui/support_screen.dart' show SupportScreen;
import '../services/ui/not_found_screen.dart';
import '../utils/common_widgets/image_viewer_screen.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
      path: '/',
      fullMatch: true,
      type: RouteType.custom(
        transitionsBuilder: (context, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    AutoRoute(path: '/home', page: HomeBottomTabsRoute.page),
    AutoRoute(page: OfflineInternetRoute.page),
    AutoRoute(page: ServerErrorRoute.page),
    AutoRoute(page: NoInternetSplashRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute( page: VendorDetailsRoute.page),
    AutoRoute( page: VendorPackageDetailsRoute.page),
    AutoRoute( page: VenuesRoute.page),
    AutoRoute( page: UpdateProfileRoute.page),
    AutoRoute( page: LocationRoute.page),
    AutoRoute( page: LanguageRoute.page),
    AutoRoute( page: InvitationTrackingRoute.page),
    AutoRoute( page: FavRoute.page),
    AutoRoute( page: SupportRoute.page),
    AutoRoute( page: VerificationRoute.page),
    AutoRoute( page: BookRoute.page),
    AutoRoute( page: BookingConfirmationRoute.page),
    AutoRoute( page: ViewBookingDetailsRoute.page),
    AutoRoute( page: CreateInvitationRoute.page),
    AutoRoute( page: NotificationRoute.page),
    AutoRoute( page: SignupRoute.page),
    AutoRoute( page: ProviderHomeBottomTabsRoute.page),
    AutoRoute( page: ImageViewerRoute.page),
    AutoRoute(path: '*', page: NotFoundRoute.page), // this must be last route

  ];
}
