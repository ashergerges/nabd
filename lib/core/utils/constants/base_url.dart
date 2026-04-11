import 'package:flutter/services.dart';

class BaseUrl {
  static const devBaseURL = 'https://test/';
  static const prodBaseURL = 'https://test/';
  static const uatBaseURL = 'https://test/';
  static const qcBaseURL = 'https://test/';

  // Static method to get the BaseUrl based on appFlavor
  static String get url {
    switch (appFlavor?.toUpperCase() ?? "") {
      case "PROD":
        return prodBaseURL;
      case "DEV":
        return devBaseURL;
      case "UAT":
        return uatBaseURL;
      case "QC":
        return qcBaseURL;
      default:
        return prodBaseURL;
    }
  }
}
