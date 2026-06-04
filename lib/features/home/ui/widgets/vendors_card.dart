import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

import '../../../../gen/assets.gen.dart';

class VendorsCard extends StatelessWidget {
  final String imageUrl;
  final String vendorName;
  final String location;
  final double rate;
  final double? width;

  const VendorsCard({
    Key? key,
    required this.imageUrl,
    required this.vendorName,
    required this.location,
    required this.rate,
     this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width:width ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary100,
            blurRadius: 5,
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
                      AppColors.black.withOpacity(0.1),
                      AppColors.black.withOpacity(0.2),
                    ],
                  ),
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
                      Text(
                        vendorName,
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w900
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Assets.svg.location.svg(
                                colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                              ),
                              8.verticalSpace,
                              Text(
                                location,
                                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                                  color: AppColors.white,
                                    fontWeight: FontWeight.w900

                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                rate.toString(),
                                style: AppTextTheme.bodyXSmall(context).copyWith(
                                  color: AppColors.white,
                                    fontWeight: FontWeight.w600

                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              4.verticalSpace,
                              Assets.svg.favouriteRate.svg(
                              ),
                            ],
                          ),
                        ],
                      ),


                      10.verticalSpace,

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
class VendorsCardShimmer extends StatelessWidget {
  final double? width;

  const VendorsCardShimmer({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary100,
            blurRadius: 5,
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

            /// Dark overlay like original
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),

            /// Content
            Padding(
              padding: 12.padAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),

                  /// Vendor name (2 lines)
                  ShimmerWidget.rectangular(
                    width: double.infinity,
                    height: 12,
                  ),
                  6.verticalSpace,
                  ShimmerWidget.rectangular(
                    width: 120,
                    height: 12,
                  ),

                  8.verticalSpace,

                  /// Divider
                  ShimmerWidget.rectangular(
                    width: 80,
                    height: 1,
                  ),

                  8.verticalSpace,

                  /// Location + Rating row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Location section
                      Row(
                        children: [
                          /// Icon placeholder
                          ShimmerWidget.circular(
                            width: 12,
                            height: 12,
                          ),
                          6.horizontalSpace,

                          /// Location text
                          ShimmerWidget.rectangular(
                            width: 80,
                            height: 10,
                          ),
                        ],
                      ),

                      /// Rating section
                      Row(
                        children: [
                          /// Rate number
                          ShimmerWidget.rectangular(
                            width: 20,
                            height: 10,
                          ),
                          4.horizontalSpace,

                          /// Star icon
                          ShimmerWidget.circular(
                            width: 12,
                            height: 12,
                          ),
                        ],
                      ),
                    ],
                  ),

                  10.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}