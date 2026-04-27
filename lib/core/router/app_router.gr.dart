// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BookScreen]
class BookRoute extends PageRouteInfo<BookRouteArgs> {
  BookRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        BookRoute.name,
        args: BookRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'BookRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookRouteArgs>(
        orElse: () => const BookRouteArgs(),
      );
      return BookScreen(key: args.key);
    },
  );
}

class BookRouteArgs {
  const BookRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'BookRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [BookingConfirmationScreen]
class BookingConfirmationRoute extends PageRouteInfo<void> {
  const BookingConfirmationRoute({List<PageRouteInfo>? children})
    : super(BookingConfirmationRoute.name, initialChildren: children);

  static const String name = 'BookingConfirmationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BookingConfirmationScreen();
    },
  );
}

/// generated route for
/// [CreateInvitationScreen]
class CreateInvitationRoute extends PageRouteInfo<void> {
  const CreateInvitationRoute({List<PageRouteInfo>? children})
    : super(CreateInvitationRoute.name, initialChildren: children);

  static const String name = 'CreateInvitationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateInvitationScreen();
    },
  );
}

/// generated route for
/// [FavScreen]
class FavRoute extends PageRouteInfo<void> {
  const FavRoute({List<PageRouteInfo>? children})
    : super(FavRoute.name, initialChildren: children);

  static const String name = 'FavRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavScreen();
    },
  );
}

/// generated route for
/// [HomeBottomTabsScreen]
class HomeBottomTabsRoute extends PageRouteInfo<HomeBottomTabsRouteArgs> {
  HomeBottomTabsRoute({
    Key? key,
    int index = 0,
    String? sportId,
    List<PageRouteInfo>? children,
  }) : super(
         HomeBottomTabsRoute.name,
         args: HomeBottomTabsRouteArgs(
           key: key,
           index: index,
           sportId: sportId,
         ),
         initialChildren: children,
       );

  static const String name = 'HomeBottomTabsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeBottomTabsRouteArgs>(
        orElse: () => const HomeBottomTabsRouteArgs(),
      );
      return HomeBottomTabsScreen(
        key: args.key,
        index: args.index,
        sportId: args.sportId,
      );
    },
  );
}

class HomeBottomTabsRouteArgs {
  const HomeBottomTabsRouteArgs({this.key, this.index = 0, this.sportId});

  final Key? key;

  final int index;

  final String? sportId;

  @override
  String toString() {
    return 'HomeBottomTabsRouteArgs{key: $key, index: $index, sportId: $sportId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeBottomTabsRouteArgs) return false;
    return key == other.key && index == other.index && sportId == other.sportId;
  }

  @override
  int get hashCode => key.hashCode ^ index.hashCode ^ sportId.hashCode;
}

/// generated route for
/// [ImageViewerScreen]
class ImageViewerRoute extends PageRouteInfo<ImageViewerRouteArgs> {
  ImageViewerRoute({
    Key? key,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
         ImageViewerRoute.name,
         args: ImageViewerRouteArgs(key: key, imageUrl: imageUrl),
         initialChildren: children,
       );

  static const String name = 'ImageViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageViewerRouteArgs>();
      return ImageViewerScreen(key: args.key, imageUrl: args.imageUrl);
    },
  );
}

class ImageViewerRouteArgs {
  const ImageViewerRouteArgs({this.key, required this.imageUrl});

  final Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'ImageViewerRouteArgs{key: $key, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageViewerRouteArgs) return false;
    return key == other.key && imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => key.hashCode ^ imageUrl.hashCode;
}

/// generated route for
/// [InvitationTrackingScreen]
class InvitationTrackingRoute extends PageRouteInfo<void> {
  const InvitationTrackingRoute({List<PageRouteInfo>? children})
    : super(InvitationTrackingRoute.name, initialChildren: children);

  static const String name = 'InvitationTrackingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InvitationTrackingScreen();
    },
  );
}

/// generated route for
/// [LanguageScreen]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
    : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageScreen();
    },
  );
}

/// generated route for
/// [LocationScreen]
class LocationRoute extends PageRouteInfo<void> {
  const LocationRoute({List<PageRouteInfo>? children})
    : super(LocationRoute.name, initialChildren: children);

  static const String name = 'LocationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LocationScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [NoInternetSplashScreen]
class NoInternetSplashRoute extends PageRouteInfo<void> {
  const NoInternetSplashRoute({List<PageRouteInfo>? children})
    : super(NoInternetSplashRoute.name, initialChildren: children);

  static const String name = 'NoInternetSplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NoInternetSplashScreen();
    },
  );
}

/// generated route for
/// [NotFoundScreen]
class NotFoundRoute extends PageRouteInfo<void> {
  const NotFoundRoute({List<PageRouteInfo>? children})
    : super(NotFoundRoute.name, initialChildren: children);

  static const String name = 'NotFoundRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotFoundScreen();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [OfflineInternetScreen]
class OfflineInternetRoute extends PageRouteInfo<OfflineInternetRouteArgs> {
  OfflineInternetRoute({
    Key? key,
    required AutoRoutePage<dynamic> currentRoute,
    List<PageRouteInfo>? children,
  }) : super(
         OfflineInternetRoute.name,
         args: OfflineInternetRouteArgs(key: key, currentRoute: currentRoute),
         initialChildren: children,
       );

  static const String name = 'OfflineInternetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OfflineInternetRouteArgs>();
      return OfflineInternetScreen(
        key: args.key,
        currentRoute: args.currentRoute,
      );
    },
  );
}

class OfflineInternetRouteArgs {
  const OfflineInternetRouteArgs({this.key, required this.currentRoute});

  final Key? key;

  final AutoRoutePage<dynamic> currentRoute;

  @override
  String toString() {
    return 'OfflineInternetRouteArgs{key: $key, currentRoute: $currentRoute}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OfflineInternetRouteArgs) return false;
    return key == other.key && currentRoute == other.currentRoute;
  }

  @override
  int get hashCode => key.hashCode ^ currentRoute.hashCode;
}

/// generated route for
/// [ServerErrorScreen]
class ServerErrorRoute extends PageRouteInfo<ServerErrorRouteArgs> {
  ServerErrorRoute({
    Key? key,
    required AutoRoutePage<dynamic> currentRoute,
    List<PageRouteInfo>? children,
  }) : super(
         ServerErrorRoute.name,
         args: ServerErrorRouteArgs(key: key, currentRoute: currentRoute),
         initialChildren: children,
       );

  static const String name = 'ServerErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServerErrorRouteArgs>();
      return ServerErrorScreen(key: args.key, currentRoute: args.currentRoute);
    },
  );
}

class ServerErrorRouteArgs {
  const ServerErrorRouteArgs({this.key, required this.currentRoute});

  final Key? key;

  final AutoRoutePage<dynamic> currentRoute;

  @override
  String toString() {
    return 'ServerErrorRouteArgs{key: $key, currentRoute: $currentRoute}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ServerErrorRouteArgs) return false;
    return key == other.key && currentRoute == other.currentRoute;
  }

  @override
  int get hashCode => key.hashCode ^ currentRoute.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [SupportScreen]
class SupportRoute extends PageRouteInfo<void> {
  const SupportRoute({List<PageRouteInfo>? children})
    : super(SupportRoute.name, initialChildren: children);

  static const String name = 'SupportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SupportScreen();
    },
  );
}

/// generated route for
/// [UpdateProfileScreen]
class UpdateProfileRoute extends PageRouteInfo<void> {
  const UpdateProfileRoute({List<PageRouteInfo>? children})
    : super(UpdateProfileRoute.name, initialChildren: children);

  static const String name = 'UpdateProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UpdateProfileScreen();
    },
  );
}

/// generated route for
/// [VendorDetailsScreen]
class VendorDetailsRoute extends PageRouteInfo<VendorDetailsRouteArgs> {
  VendorDetailsRoute({
    Key? key,
    required int vendorDetailsId,
    List<PageRouteInfo>? children,
  }) : super(
         VendorDetailsRoute.name,
         args: VendorDetailsRouteArgs(
           key: key,
           vendorDetailsId: vendorDetailsId,
         ),
         initialChildren: children,
       );

  static const String name = 'VendorDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VendorDetailsRouteArgs>();
      return VendorDetailsScreen(
        key: args.key,
        vendorDetailsId: args.vendorDetailsId,
      );
    },
  );
}

class VendorDetailsRouteArgs {
  const VendorDetailsRouteArgs({this.key, required this.vendorDetailsId});

  final Key? key;

  final int vendorDetailsId;

  @override
  String toString() {
    return 'VendorDetailsRouteArgs{key: $key, vendorDetailsId: $vendorDetailsId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VendorDetailsRouteArgs) return false;
    return key == other.key && vendorDetailsId == other.vendorDetailsId;
  }

  @override
  int get hashCode => key.hashCode ^ vendorDetailsId.hashCode;
}

/// generated route for
/// [VendorPackageDetailsScreen]
class VendorPackageDetailsRoute extends PageRouteInfo<void> {
  const VendorPackageDetailsRoute({List<PageRouteInfo>? children})
    : super(VendorPackageDetailsRoute.name, initialChildren: children);

  static const String name = 'VendorPackageDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VendorPackageDetailsScreen();
    },
  );
}

/// generated route for
/// [VenuesScreen]
class VenuesRoute extends PageRouteInfo<VenuesRouteArgs> {
  VenuesRoute({
    Key? key,
    required ServiceCategory category,
    List<PageRouteInfo>? children,
  }) : super(
         VenuesRoute.name,
         args: VenuesRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'VenuesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VenuesRouteArgs>();
      return VenuesScreen(key: args.key, category: args.category);
    },
  );
}

class VenuesRouteArgs {
  const VenuesRouteArgs({this.key, required this.category});

  final Key? key;

  final ServiceCategory category;

  @override
  String toString() {
    return 'VenuesRouteArgs{key: $key, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VenuesRouteArgs) return false;
    return key == other.key && category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode;
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    Key? key,
    required String phone,
    List<PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return VerificationScreen(key: args.key, phone: args.phone);
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.phone});

  final Key? key;

  final String phone;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, phone: $phone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationRouteArgs) return false;
    return key == other.key && phone == other.phone;
  }

  @override
  int get hashCode => key.hashCode ^ phone.hashCode;
}

/// generated route for
/// [ViewBookingDetailsScreen]
class ViewBookingDetailsRoute extends PageRouteInfo<void> {
  const ViewBookingDetailsRoute({List<PageRouteInfo>? children})
    : super(ViewBookingDetailsRoute.name, initialChildren: children);

  static const String name = 'ViewBookingDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ViewBookingDetailsScreen();
    },
  );
}
