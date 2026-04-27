import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';


class PackageCard extends StatelessWidget {
  final String title;
  final int capacity;
  final String location;
  final double rating;
  final double price;
  final String imageUrl;
  final double discountPercent;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  const PackageCard({
    super.key,
    required this.title,
    required this.capacity,
    required this.location,
    required this.rating,
    required this.price,
    required this.imageUrl,
    this.discountPercent = 0,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.onTap,
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
        padding: 12.padVertical+16.padHorizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 140,
              child: Stack(
                children: [
                  // Image
                  CustomNetworkImageCached(
                    imageUrl: imageUrl,radius:12 , width: 130,
                    height: 160,),


                  // Discount badge (top-left)
                  if (discountPercent > 0)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Text(
                        '$discountPercent%\nOFF',
                        textAlign: TextAlign.center,
                          style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.white,fontWeight: FontWeight.w600)
                      ),
                    ),

                  // Favorite icon (top-right)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: OnTap(
                      onTap: onFavoriteTap,
                      child: Container(
                        width: 32,
                        height: 32,
                        padding: 5.padAll,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child:isFavorite?Assets.svg.favouriteCircle.svg(height: 25.h):Assets.svg.favouritePackage.svg(height: 25.h),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style:AppTextTheme.bodyMedium(context).copyWith(fontWeight: FontWeight.w700,),
                  ),
                8.verticalSpace,

                  // Capacity
                  Row(
                    children: [
                      Assets.svg.people.svg(height: 16.h),
                      4.horizontalSpace,
                      Text(
                        LocaleKeys.accommodatesUpTo500Guests.tr(args: ['$capacity']),
                          style:AppTextTheme.bodyXSmall(context)
                      ),

                    ],
                  ),
                  3.verticalSpace,
                  Row(
                    children: [
                      Row(
                        children: [
                          Assets.svg.location.svg(height: 16.h),
                          4.horizontalSpace,

                          Text(
                            location,
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin:10.padHorizontal,
                        width: 1,
                        height: 14,
                        color:AppColors.primary100,
                      ),
                      Row(
                        children: [
                          Assets.svg.favouriteRate.svg(height: 16.h),
                          4.horizontalSpace,
                          Text(
                            rating.toString(),
                              style: AppTextTheme.bodyXSmall(context),
                          ),
                        ],
                      ),


                    ],
                  ),

                  8.verticalSpace,
                  const Divider(
                    color:AppColors.primary100,
                    thickness: 0.8,
                    endIndent: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                           Text(
                          LocaleKeys.priceStartsFrom.tr(),
                              style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.primary)
                          ),
                          2.verticalSpace,
                          RichText(
                            text: TextSpan(
                              children: [

                                TextSpan(
                                  text: price.toStringAsFixed(0).replaceAllMapped(
                                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                        (m) => '${m[1]},',
                                  ),
                                    style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700,color: AppColors.primary)
                                ),
                                TextSpan(
                                  text: LocaleKeys.sar.tr(),
                                  style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.primary)
                                ),
                              ],
                            ),
                          )                        ],
                      ),

                      Container(
                        width: 34,
                        height: 34,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child:  Icon(
                          Icons.north_west_rounded,
                          size: 18,
                          color:AppColors.primary100,
                        ),
                      ),
                    ],
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


class PackageCardShimmer extends StatelessWidget {
  const PackageCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.primary100),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: 12.padVertical + 16.padHorizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ───────── Image Section ─────────
          SizedBox(
            width: 130,
            height: 140,
            child: Stack(
              children: [
                /// Image placeholder
                ShimmerWidget.rectangular(
                  width: 130,
                  height: 140,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                /// Discount badge placeholder
                Positioned(
                  top: 8,
                  left: 8,
                  child: ShimmerWidget.rectangular(
                    width: 35,
                    height: 28,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                /// Favorite icon placeholder
                Positioned(
                  top: 8,
                  right: 8,
                  child: ShimmerWidget.circular(
                    width: 32,
                    height: 32,
                  ),
                ),
              ],
            ),
          ),

          16.horizontalSpace,

          /// ───────── Content Section ─────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                ShimmerWidget.rectangular(
                  width: double.infinity,
                  height: 14,
                ),

                8.verticalSpace,

                /// Capacity row
                Row(
                  children: [
                    ShimmerWidget.circular(width: 16, height: 16),
                    4.horizontalSpace,
                    ShimmerWidget.rectangular(width: 120, height: 10),
                  ],
                ),

                6.verticalSpace,

                /// Location + Rating row
                Row(
                  children: [
                    /// Location
                    Row(
                      children: [
                        ShimmerWidget.circular(width: 16, height: 16),
                        4.horizontalSpace,
                        ShimmerWidget.rectangular(width: 80, height: 10),
                      ],
                    ),

                    Container(
                      margin: 10.padHorizontal,
                      width: 1,
                      height: 14,
                      color: AppColors.primary100,
                    ),

                    /// Rating
                    Row(
                      children: [
                        ShimmerWidget.circular(width: 16, height: 16),
                        4.horizontalSpace,
                        ShimmerWidget.rectangular(width: 30, height: 10),
                      ],
                    ),
                  ],
                ),

                8.verticalSpace,

                /// Divider
                const Divider(
                  color: AppColors.primary100,
                  thickness: 0.8,
                  endIndent: 50,
                ),

                /// Price + arrow
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Price section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget.rectangular(
                          width: 90,
                          height: 10,
                        ),
                        4.verticalSpace,
                        ShimmerWidget.rectangular(
                          width: 70,
                          height: 12,
                        ),
                      ],
                    ),

                    /// Arrow button
                    ShimmerWidget.circular(
                      width: 34,
                      height: 34,
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