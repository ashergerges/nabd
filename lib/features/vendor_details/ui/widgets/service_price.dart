import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';

class ServicePrice extends StatelessWidget {
  const ServicePrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.padVertical+16.padHorizontal,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("500",style: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.white,fontWeight: FontWeight.w700),),
          2.verticalSpace,
          Assets.svg.riyal.svg(height: 24.h),
          2.verticalSpace,
          Text("ساعة إضافية",style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.white),),

        ],
      ),
    );
  }
}
