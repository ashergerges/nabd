import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class VendorCard extends StatelessWidget {
  final String title;
  final String dec;
  final double price;
  final String imageUrl;
  final double discountPercent;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  const VendorCard({
    super.key,
    required this.title,
    required this.dec,
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
              height: 115,
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

                  Text(
                      dec,
                      style:AppTextTheme.bodyXSmall(context)
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
