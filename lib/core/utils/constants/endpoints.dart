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

  String get timeSlotsUrl => r'api/app/booking/available-slots';
  String get paymentMethodUrl => r'api/app/payment_types/all';
  String get makeBookUrl => r'api/app/booking/make';

  //my booking
  String get myBookingUrl => r'api/app/booking/my-bookings';
  String get bookingDetailsUrl => r'api/app/booking/details';
  String get reviewAddUrl => r'api/app/review/add';


}
