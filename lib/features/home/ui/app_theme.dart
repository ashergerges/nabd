import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1E5A8A);
  static const primaryDark = Color(0xFF0A2A3A);
  static const primaryLight = Color(0xFF2E7AB0);
  static const accent = Color(0xFF4A9AC0);
  static const background = Color(0xFFF0F4F8);
  static const surface = Colors.white;
  static const textDark = Color(0xFF0A2A3A);
  static const textMuted = Color(0xFF5A6E8A);
  static const emerald = Color(0xFF0E7C5E);
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFEAB308);
  static const danger = Color(0xFFEF4444);
  static const positiveLight = Color(0xFFDCFCE7);
  static const warningLight = Color(0xFFFEF9C3);
  static const negativeLight = Color(0xFFFEE2E2);
}

class AppTextStyles {
  static const heading = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
  );
  static const body = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );
  static const label = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    color: AppColors.textMuted,
    fontSize: 11,
  );
}

class AppRadius {
  static const card = BorderRadius.all(Radius.circular(20));
  static const chip = BorderRadius.all(Radius.circular(30));
  static const button = BorderRadius.all(Radius.circular(25));
}
