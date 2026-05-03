import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
      builder: (context, state) {

        if (state.vendorDetails == null) {
          return const HeaderCardShimmer();
        }
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
                          imageUrl: state.vendorDetails?.image??AppStrings.kTestNetworkImage,
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
                              state.vendorDetails?.name??"",
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
                                    LocaleKeys.upTo500Guests.tr(args: ["${state.vendorDetails?.guestCount??"0"}"]),
                                    style: AppTextTheme.bodyXSmall(context),
                                  ),
                                ),
                                8.horizontalSpace,
                                Assets.svg.favouriteRate.svg(height: 16.h),
                                Text(state.vendorDetails?.avgRating?.toString()??"",
                                    style: AppTextTheme.bodyXSmall(context)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  OnTap(
                    onTap: (){
                      UrlLauncher.openGoogleMapWithDic(double.parse(state.vendorDetails?.lat??"0"), double.parse(state.vendorDetails?.long??"0"));
                    },
                    child: Row(
                      children: [
                        Assets.svg.location.svg(height: 16.h),
                        4.horizontalSpace,
                        Text(
                          state.vendorDetails?.address??"",
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                  state.vendorDetails?.description??"0",
                    style: AppTextTheme.bodySmall(
                      context,
                    ).copyWith(color: AppColors.neutral400),
                  ),
                  8.verticalSpace,
                  Container(
                    padding: 16.padHorizontal + 4.padVertical,
                    decoration: BoxDecoration(
                      color: AppColors.secondary50,
                      border: Border.all(color: AppColors.secondary100),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.svg.checkmark.svg(height: 24.h),
                        8.horizontalSpace,
                        Text(
                          state.vendorDetails?.statusText??"0",
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
      },
    );
  }
}
class HeaderCardShimmer extends StatelessWidget {
  const HeaderCardShimmer({super.key});

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
                  // Circle Image shimmer
                  ShimmerWidget.circular(
                    width: 80.w,
                    height: 80.w,
                  ),
                  12.horizontalSpace,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        ShimmerWidget.rectangular(width: 120.w, height: 14.h),
                        8.verticalSpace,

                        Row(
                          children: [
                            ShimmerWidget.rectangular(width: 80.w, height: 12.h),
                            8.horizontalSpace,
                            ShimmerWidget.rectangular(width: 40.w, height: 12.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              8.verticalSpace,

              // Location
              ShimmerWidget.rectangular(width: 100.w, height: 12.h),

              8.verticalSpace,

              // Description
              ShimmerWidget.rectangular(width: 220.w, height: 12.h),
              6.verticalSpace,
              ShimmerWidget.rectangular(width: 180.w, height: 12.h),
              6.verticalSpace,
              ShimmerWidget.rectangular(width: 200.w, height: 12.h),

              12.verticalSpace,

              // Available badge
              ShimmerWidget.rectangular(width: 120.w, height: 32.h, shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ) ,),
            ],
          ),
        ),
        Divider(color: AppColors.primary100),
      ],
    );
  }
}