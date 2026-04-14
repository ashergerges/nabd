import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: 12.padVertical.add(48.padStart),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.circleBackgroundColor,
                          blurRadius: 4,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CircleImage(
                      imageUrl: AppStrings.kTestNetworkImage,
                      size: 80.h,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'قاعة كريستال',
                          style: AppTextTheme.headingSmall(
                            context,
                          ).copyWith(fontWeight: FontWeight.w700),
                        ),
                        8.verticalSpace,
                        Row(
                          children: [
                            Assets.svg.people.svg(height: 16.h),
                            2.horizontalSpace,
                            Flexible(
                              child: Text(
                                ' حتى 500 ضيف',
                                style: AppTextTheme.bodyXSmall(context),
                              ),
                            ),
                            8.horizontalSpace,
                            Assets.svg.favouriteRate.svg(height: 16.h),
                            Text(' 4.9', style: AppTextTheme.bodyXSmall(context)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Assets.svg.location.svg(height: 16.h),
                  4.horizontalSpace,
                  Text(
                    "الرياض، الملقا",
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textColor,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Text(
                "جناح: غرفة عروس فاخرة خاصة 👰.\nخدمات الطعام: بوفيه فاخر 🍽️.\nالموقع: قلب الرياض.\nالأجواء: أجواء ملكية عصرية 🏛️.",
                style: AppTextTheme.bodySmall(
                  context,
                ).copyWith(color: AppColors.neutral400),
              ),
              8.verticalSpace,
              Container(
                padding:16.padHorizontal+4.padVertical,
                decoration: BoxDecoration(
                  color: AppColors.secondary50,
                  border: Border.all(color: AppColors.secondary100),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Assets.svg.checkmark.svg(height: 24.h),
                    8.horizontalSpace,
                    Text(
                      'متوفر الآن',
                      style: AppTextTheme.bodySmall(
                        context,
                      ).copyWith(color: AppColors.secondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(color: AppColors.primary100,)
      ],
    );
  }
}
