import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as dir;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

class InviteSummaryWidgetShimmer extends StatelessWidget {
  const InviteSummaryWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: dir.TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ── Top Progress Card ─────────────────────
            Container(
              padding: 20.padAll,
              decoration: BoxDecoration(
                color: const Color(0xFFFDF0FF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFFD3FA)),
                boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        ShimmerWidget.rectangular(width: 180.w, height: 16.h),

                        6.verticalSpace,

                        // Subtitle
                        ShimmerWidget.rectangular(width: 140.w, height: 12.h),

                        12.verticalSpace,

                        // Button
                        ShimmerWidget.rectangular(
                          width: 120.w,
                          height: 40.h,
                          shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                  ),

                  16.horizontalSpace,

                  // Progress circle
                  ShimmerWidget.circular(width: 90.w, height: 90.w),
                ],
              ),
            ),

            16.verticalSpace,

            // ── Stats Section ─────────────────────────
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left big card
                  Expanded(child: _StatCardShimmer(big: true)),

                  12.horizontalSpace,

                  // Right stacked cards
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: _StatCardShimmer()),

                        12.verticalSpace,

                        Expanded(child: _StatCardShimmer()),
                      ],
                    ),
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

class _StatCardShimmer extends StatelessWidget {
  final bool big;

  const _StatCardShimmer({super.key, this.big = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 18.padAll,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          ShimmerWidget.circular(
            width: big ? 80.w : 50.w,
            height: big ? 80.w : 50.w,
          ),

          20.verticalSpace,

          // Label
          ShimmerWidget.rectangular(width: 90.w, height: 12.h),

          8.verticalSpace,

          // Value
          ShimmerWidget.rectangular(width: 50.w, height: 20.h),
        ],
      ),
    );
  }
}