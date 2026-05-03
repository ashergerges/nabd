import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import 'package:nawy/gen/locale_keys.g.dart';


class VendorPackageDetailsBottomNavigationBar extends StatelessWidget {
  const VendorPackageDetailsBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
  builder: (context, state) {
    if (state.packageDetails == null) {
      return const VendorPackageDetailsBottomNavigationBarShimmer();
    }
    return Container(
      width: double.infinity,
      padding: 32.padHorizontal+16.padVertical,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(color: AppColors.primary100)

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [

                          TextSpan(
                              text: state.packageDetails?.priceAfter??"",
                              style: AppTextTheme.headingXLargeBold(context).copyWith(fontWeight: FontWeight.w700,color: AppColors.primary)
                          ),
                          TextSpan(
                              text: LocaleKeys.sar.tr(),
                              style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.primary)
                          ),
                        ],
                      ),
                    ),
                    Text("${state.packageDetails?.priceBefore} ${LocaleKeys.riyal.tr()}",
                        style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w300,decorationColor: AppColors.primary,decoration: TextDecoration.lineThrough,color: AppColors.primary)
                    )
                  ],
                ),
              ),
              Expanded(child: AppButton(text: LocaleKeys.bookNow.tr(),onTap: (){
                BookRoute(packageId:state.packageDetails?.id??0 ).push(context);
              },))
            ],
          ),
        ],
      ),
    );
  },
);
  }
}

class VendorPackageDetailsBottomNavigationBarShimmer extends StatelessWidget {
  const VendorPackageDetailsBottomNavigationBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 32.padHorizontal + 16.padVertical,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // 🔥 Price section
              Expanded(
                child: Column(
                  children: [
                    // Price
                    ShimmerWidget.rectangular(
                      width: 80.w,
                      height: 20.h,
                    ),

                    8.verticalSpace,

                    // Old price
                    ShimmerWidget.rectangular(
                      width: 60.w,
                      height: 12.h,
                    ),
                  ],
                ),
              ),

              12.horizontalSpace,

              // 🔥 Button shimmer
              Expanded(
                child: ShimmerWidget.rectangular(
                  width: double.infinity,
                  height: 48.h,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}