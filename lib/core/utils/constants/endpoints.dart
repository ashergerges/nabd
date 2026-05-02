class Endpoints {
  const Endpoints();

  String get refreshTokenUrl => r'api/auth/refresh-token';

  String get updateUserDataUrl => r'api/updateUserData';

  String get getNotificationsUrl => r'api/getNotifications';

  String get loginUrl => r'api/app/auth/login';
  String get reSendOTPUrl => r'api/app/auth/resend-otp';
  String get validateOTPUrl => r'api/app/auth/verify-otp';
  //home
  String get homeUrl => r'api/app/home';
  //categories
  String get categoriesUrl => r'api/app/categories';
  //venues
  String get venuesUrl => r'api/app/products/by-category';
  //vendor details
  String get vendorDetailsUrl => r'api/app/products/details';
  String get wishlistToggleUrl => r'api/app/user/wishlist/toggle';
  String get wishlistTypeUrl => r'api/app/user/wishlist';
  String get packageDetailsUrl => r'api/app/package/details';


}
