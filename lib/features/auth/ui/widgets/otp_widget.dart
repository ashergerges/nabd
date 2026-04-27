import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;
  final int length;
  final bool isSecure;
  final bool autofocus;

  const OtpInput({
    super.key,
    required this.onCompleted,
    required this.onChanged,
    this.length = 4,
    this.isSecure = false,
    this.autofocus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: length,
        autofocus: autofocus,
        cursor: Container(width: 10, height: 2, color: Colors.black),
        obscureText: isSecure,
        focusedPinTheme: PinTheme(
          height: 60.h,
          width: 60.w,
          textStyle: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w700,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.primary, width: 1.5),
          ),
        ),
        submittedPinTheme: PinTheme(
          height: 60.h,
          width: 60.w,
          textStyle: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w700,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.primary, width: 1.5),
          ),
        ),
        defaultPinTheme: PinTheme(
          height: 60.h,
          width: 60.w,
          textStyle: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w700,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.neutral100, width: 1.5),
          ),
        ),
        errorPinTheme: PinTheme(
          height: 60.h,
          width: 60.w,
          textStyle: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w700,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.error, width: 1.5),
          ),
        ),
        onChanged: (value) {
          onChanged(value);
        },
        onCompleted: (pin) {
          onCompleted(pin);
        },
      ),
    );
  }
}
