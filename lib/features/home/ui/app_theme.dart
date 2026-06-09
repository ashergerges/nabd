import 'package:flutter/material.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';



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
