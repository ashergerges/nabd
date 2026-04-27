class Endpoints {
  const Endpoints();

  String get refreshTokenUrl => r'api/auth/refresh-token';

  String get updateUserDataUrl => r'api/updateUserData';

  String get getNotificationsUrl => r'api/getNotifications';

  String get loginUrl => r'api/app/auth/login';
  String get reSendOTPUrl => r'api/app/auth/resend-otp';
  String get validateOTPUrl => r'api/app/auth/verify-otp';


}
