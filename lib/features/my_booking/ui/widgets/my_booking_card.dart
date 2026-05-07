import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class MyBookingCard extends StatelessWidget {
  final String title;
  final String packageName;
  final String date;
  final String imageUrl;
  final num price;
  final bool showRateButton;
  final VoidCallback? onTap;
  final VoidCallback? onTapRate;

  const MyBookingCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.packageName,
    required this.price,
    this.showRateButton = false,
    this.onTap,
    this.onTapRate,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.primary100),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: 12.padVertical + 16.padHorizontal,
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch, // مهم
                //            mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CustomNetworkImageCached(
                      imageUrl: imageUrl,
                      radius: 12,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Text(
                          title,
                          style: AppTextTheme.bodyMedium(
                            context,
                          ).copyWith(fontWeight: FontWeight.w700),
                        ),
                        4.verticalSpace,
                        Text(title, style: AppTextTheme.bodySmall(context)),

                        const Divider(
                          color: AppColors.primary100,
                          thickness: 0.8,
                        ),
                        Row(
                          children: [
                            Assets.svg.dateTime.svg(height: 16.h),
                            4.horizontalSpace,
                            Expanded(
                              child: Text(
                                date,
                                maxLines: 1,
                                style: AppTextTheme.bodyXSmall(context),
                              ),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: price
                                    .toStringAsFixed(0)
                                    .replaceAllMapped(
                                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                      (m) => '${m[1]},',
                                    ),
                                style: AppTextTheme.bodyMedium(context)
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                              ),
                              TextSpan(
                                text: LocaleKeys.sar.tr(),
                                style: AppTextTheme.bodyMedium(
                                  context,
                                ).copyWith(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (showRateButton) ...[
              10.verticalSpace,
              AppButton(
                onTap:onTapRate ,
                text: "قيّم تجربتك",
                background: AppColors.white,
                radius: 12.r,
                textColor: AppColors.textColor,
                border: Border.all(color: AppColors.primary100),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
class MyBookingCardShimmer extends StatelessWidget {
  const MyBookingCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.primary100),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: 12.padVertical + 16.padHorizontal,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔥 Image
            Expanded(
              child: ShimmerWidget.rectangular(
                width: double.infinity,
                height: 120.h,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            16.horizontalSpace,

            // 🔥 Content
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  ShimmerWidget.rectangular(
                    width: 140.w,
                    height: 14.h,
                  ),

                  4.verticalSpace,

                  // Subtitle
                  ShimmerWidget.rectangular(
                    width: 100.w,
                    height: 12.h,
                  ),

                  12.verticalSpace,

                  const Divider(
                    color: AppColors.primary100,
                    thickness: 0.8,
                  ),

                  8.verticalSpace,

                  // Date Row
                  Row(
                    children: [
                      ShimmerWidget.circular(
                        width: 16.w,
                        height: 16.w,
                      ),

                      4.horizontalSpace,

                      Expanded(
                        child: ShimmerWidget.rectangular(
                          width: double.infinity,
                          height: 12.h,
                        ),
                      ),
                    ],
                  ),

                  12.verticalSpace,

                  // Price
                  ShimmerWidget.rectangular(
                    width: 90.w,
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}