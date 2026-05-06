import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
class BookingDetailsShimmer extends StatelessWidget {
  const BookingDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.padHorizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Status Card ─────────────────────────────
          Container(
            width: double.infinity,
            padding: 16.padAll,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status badge
                ShimmerWidget.rectangular(
                  width: 120.w,
                  height: 30.h,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                16.verticalSpace,

                // Payment date
                ShimmerWidget.rectangular(
                  width: double.infinity,
                  height: 12.h,
                ),

                8.verticalSpace,

                // Booking ID
                ShimmerWidget.rectangular(
                  width: 160.w,
                  height: 12.h,
                ),
              ],
            ),
          ),

          24.verticalSpace,

          // ── Package row ─────────────────────────────
          Row(
            children: [
              ShimmerWidget.rectangular(
                width: 120.w,
                height: 120.h,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.rectangular(
                      width: 140.w,
                      height: 14.h,
                    ),
                    8.verticalSpace,
                    ShimmerWidget.rectangular(
                      width: 100.w,
                      height: 12.h,
                    ),
                    6.verticalSpace,
                    ShimmerWidget.rectangular(
                      width: 120.w,
                      height: 12.h,
                    ),
                  ],
                ),
              )
            ],
          ),

          12.verticalSpace,
          Divider(color: AppColors.primary100),
          12.verticalSpace,

          // ── Event details title ─────────────────────
          ShimmerWidget.rectangular(width: 140.w, height: 14.h),

          16.verticalSpace,

          // Date row
          Row(
            children: [
              ShimmerWidget.circular(width: 24.w, height: 24.w),
              8.horizontalSpace,
              Expanded(
                child: ShimmerWidget.rectangular(
                  width: double.infinity,
                  height: 12.h,
                ),
              ),
            ],
          ),

          8.verticalSpace,

          // Location row
          Row(
            children: [
              ShimmerWidget.circular(width: 24.w, height: 24.w),
              8.horizontalSpace,
              Expanded(
                child: ShimmerWidget.rectangular(
                  width: 160.w,
                  height: 12.h,
                ),
              ),
            ],
          ),

          8.verticalSpace,

          // Phone row
          Row(
            children: [
              ShimmerWidget.circular(width: 24.w, height: 24.w),
              8.horizontalSpace,
              Expanded(
                child: ShimmerWidget.rectangular(
                  width: 120.w,
                  height: 12.h,
                ),
              ),
            ],
          ),

          12.verticalSpace,
          Divider(color: AppColors.neutral50),

          24.verticalSpace,

          // ── Services title ─────────────────────────
          ShimmerWidget.rectangular(width: 160.w, height: 14.h),

          12.verticalSpace,

          // Services list
          Column(
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: ShimmerWidget.rectangular(
                  width: 180.w,
                  height: 12.h,
                ),
              );
            }),
          ),

          12.verticalSpace,
          Divider(color: AppColors.neutral50),
        ],
      ),
    );
  }
}