import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

class SummaryStep extends StatelessWidget {
  const SummaryStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: 24.padHorizontal + 24.padTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ملخص الحجز", style: AppTextTheme.bodyLargeSemiBold(context)),
          12.verticalSpace,
          Container(
            padding: 16.padAll,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "باقة الزفاف الملكي",
                            style: AppTextTheme.bodyMediumSemiBold(context),
                          ),
                          4.verticalSpace,
                          Text(
                            "قاعة كريستال",
                            style: AppTextTheme.bodySmall(context),
                          ),
                        ],
                      ),
                    ),
                    CustomNetworkImageCached(
                      height: 80.h,
                      width: 80.h,
                      imageUrl: AppStrings.kTestNetworkImage,
                      radius: 20,
                    ),
                  ],
                ),
                12.verticalSpace,
                Text(
                  "يستوعب حتى 300 ضيف",
                  style: AppTextTheme.bodySmall(
                    context,
                  ).copyWith(color: AppColors.neutral400),
                ),
                12.verticalSpace,
                Divider(color: AppColors.primary100),
                12.verticalSpace,
                Text(
                  "التاريخ: الخميس، 20 فبراير 2026",
                  style: AppTextTheme.bodySmallMediumWeight(context),
                ),
                8.verticalSpace,
                Text(
                  "الوقت: 09:00 صباحاً2026",
                  style: AppTextTheme.bodySmallMediumWeight(context),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Text("تفاصيل السعر", style: AppTextTheme.bodyLargeSemiBold(context)),
          12.verticalSpace,
          Container(
            padding: 24.padAll,

            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border.all(color: AppColors.primary100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("سعر الباقة", style: AppTextTheme.bodySmall(context)),
                    Text(
                      "1,500 رس",
                      style: AppTextTheme.bodySmallMediumWeight(context),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "ضريبة القيمة المضافة (15%)",
                      style: AppTextTheme.bodySmall(context),
                    ),
                    Text(
                      "200 رس",
                      style: AppTextTheme.bodySmallMediumWeight(context),
                    ),
                  ],
                ),
                12.verticalSpace,
                Divider(color: AppColors.primary100),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "الاجمالي",
                      style: AppTextTheme.bodySmall(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                    Text(
                      "1700 رس",
                      style: AppTextTheme.bodySmallMediumWeight(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
