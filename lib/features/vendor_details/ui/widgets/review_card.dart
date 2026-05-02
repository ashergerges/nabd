import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String comment;
  final String date;
  final double rating;
  final String? imageUrl;

  const ReviewCard({
    super.key,
    required this.name,
    required this.comment,
    required this.date,
    required this.rating,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 25.padAll,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      size: 56.h,
                    ),
                  ),
                  8.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTextTheme.bodyMediumMediumWeight(
                          context,
                        ).copyWith(fontWeight: FontWeight.w700),
                      ),
                      8.verticalSpace,
                      _StarRating(rating: rating),
                    ],
                  ),



                ],
              ),
              Text(
                  date,
                  style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w300)
              ),

            ],
          ),
          12.verticalSpace,
          Text(
              comment,
              textAlign: TextAlign.right,
              style: AppTextTheme.bodySmall(context)
          ),
        ],
      ),
    );
  }
}
class ReviewCardShimmer extends StatelessWidget {
  const ReviewCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 25.padAll,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Avatar
                  ShimmerWidget.circular(
                    width: 56.w,
                    height: 56.w,
                  ),
                  8.horizontalSpace,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      ShimmerWidget.rectangular(
                        width: 90.w,
                        height: 12.h,
                      ),
                      8.verticalSpace,

                      // Stars
                      ShimmerWidget.rectangular(
                        width: 110.w,
                        height: 12.h,
                      ),
                    ],
                  ),
                ],
              ),

              // Date
              ShimmerWidget.rectangular(
                width: 60.w,
                height: 10.h,
              ),
            ],
          ),

          12.verticalSpace,

          // Comment lines
          ShimmerWidget.rectangular(
            width: double.infinity,
            height: 12.h,
          ),
          6.verticalSpace,
          ShimmerWidget.rectangular(
            width: double.infinity,
            height: 12.h,
          ),
          6.verticalSpace,
          ShimmerWidget.rectangular(
            width: 200.w,
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
class _StarRating extends StatelessWidget {
  final double rating;
  const _StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starType = _getStarType(index);
        return SvgPicture.asset(
          starType,
          width: 18,
          height: 18,
        );
      }),
    );
  }

  String _getStarType(int index) {
    if (index < rating.floor()) {
      return Assets.svg.favouriteRate.path;
    } else if (index < rating) {
      return Assets.svg.starHalf.path;
    } else {
      return Assets.svg.starEmpty.path;
    }
  }
}