import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

class OfferCard extends StatelessWidget {
  final String imageUrl;
  final String packageName;
  final String jobTitle;
  final String personName;
  final String personImageUrl;
  final String discountPercentage;

  const OfferCard({
    Key? key,
    required this.imageUrl,
    required this.packageName,
    required this.jobTitle,
    required this.personName,
    required this.personImageUrl,
    required this.discountPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary100,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.white.withOpacity(0.85),
                      AppColors.white.withOpacity(0.75),
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstATop,
                child: CustomNetworkImageCached(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Text(
                '$discountPercentage\nOFF',
                textAlign: TextAlign.center,
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding:12.padAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Package Name (Arabic text from image)
                      Text(
                        packageName,
                        style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                          color: AppColors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      8.verticalSpace,
                      Container(
                        height: 1,
                        width: 80.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        jobTitle,
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          color: AppColors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      10.verticalSpace,

                      // Person Info Row
                      Row(
                        children: [
                          // Circle Avatar
                          CircleImage(imageUrl: personImageUrl,size: 25.h,),
                          6.horizontalSpace,
                          // Person Name
                          Expanded(
                            child: Text(
                              personName,
                              style: AppTextTheme.bodyXSmall(context).copyWith(
                                color: AppColors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
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
class OfferCardShimmer extends StatelessWidget {
  const OfferCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary100,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            /// Background shimmer (image placeholder)
            Positioned.fill(
              child: ShimmerWidget.rectangular(
                width: double.infinity,
                height: double.infinity,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            /// Dark overlay (same as original for realism)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),

            /// Discount shimmer
            Positioned(
              top: 8,
              left: 8,
              child: ShimmerWidget.rectangular(
                width: 35,
                height: 30,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),

            /// Content
            Padding(
              padding: 12.padAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),

                  /// Package name (2 lines)
                  ShimmerWidget.rectangular(
                    width: double.infinity,
                    height: 12,
                  ),
                  6.verticalSpace,
                  ShimmerWidget.rectangular(
                    width: 100,
                    height: 12,
                  ),

                  8.verticalSpace,

                  /// Divider
                  ShimmerWidget.rectangular(
                    width: 80,
                    height: 1,
                  ),

                  8.verticalSpace,

                  /// Job title
                  ShimmerWidget.rectangular(
                    width: 70,
                    height: 10,
                  ),

                  10.verticalSpace,

                  /// Person row
                  Row(
                    children: [
                      /// Avatar
                      ShimmerWidget.circular(
                        width: 25,
                        height: 25,
                      ),

                      6.horizontalSpace,

                      /// Name
                      Expanded(
                        child: ShimmerWidget.rectangular(
                          height: 10,
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