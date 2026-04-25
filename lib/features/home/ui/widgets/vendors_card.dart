import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
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
                        vendorName,
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
                                style: AppTextTheme.bodyXSmall(context).copyWith(
                                  color: AppColors.white,
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
