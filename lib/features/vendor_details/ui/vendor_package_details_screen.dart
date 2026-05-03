import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as dir;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import 'package:nawy/features/vendor_details/ui/widgets/tip_card.dart';
import 'package:nawy/features/vendor_details/ui/widgets/vendor_package_details_bottom_navigation_bar.dart';
import 'package:nawy/features/vendor_details/ui/widgets/venue_image_slider.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../../../gen/assets.gen.dart';
@RoutePage()
class VendorPackageDetailsScreen extends StatelessWidget {
  final int vendorPackageId;
  const VendorPackageDetailsScreen({super.key, required this.vendorPackageId});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => VendorDetailsCubit()..packageDetails(vendorPackageId),
  child: BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
  builder: (context, state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 380.h,
              child:(state.vendorDetails?.gallery?.isEmpty??false)?VenueImageSliderShimmer(): VenueImageSlider(
                imageUrls: state.packageDetails?.galleries?.map((e)=>e.image??"").toList()??[],
                isFavorite:state.packageDetails?.isFavorite??false ,
                onFavoriteTap: (){
                  context.read<VendorDetailsCubit>().wishlistPackage(vendorPackageId);
                },
                onShare: () {},
                onBack: () => context.maybePop(),
              ),
            ),
            24.verticalSpace,
            state.packageDetails == null? PackageDetailsShimmer():Padding(
              padding:16.padHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.packageDetails?.title??"",style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w600),),
                  8.verticalSpace,
                  OnTap(
                    onTap: (){
                      // UrlLauncher.openGoogleMapWithDic(double.parse(state.packageDetails?.lat??"0"), double.parse(state.packageDetails?.long??"0"));
                    },
                    child: Row(
                      children: [
                        Assets.svg.location.svg(height: 24.h),
                        4.horizontalSpace,
                        Text(
                          state.packageDetails?.address??"",
                          style: AppTextTheme.bodySmall(context).copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  LastBookingPeople(users: state.packageDetails?.bookedClients?.map((e)=>e.image??"").toList()??[],),
                  24.verticalSpace,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:  [
                      TipCard(text: "300 ضيف"),
                      TipCard(text: "يجب الحجز قبل أسبوعين"),
                      TipCard(text: "بدون موسيقى"),
                      TipCard(text: "شامل الضيافة"),
                    ],
                  ),
                  24.verticalSpace,
                  Text("وصف",style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w600),),
                  8.verticalSpace,
                 Text(state.packageDetails?.description??"",
                 style: AppTextTheme.bodyMedium(context),),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:VendorPackageDetailsBottomNavigationBar() ,
    );
  },
),
);
  }
}



class PackageDetailsShimmer extends StatelessWidget {
  const PackageDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.padHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Title
          ShimmerWidget.rectangular(
            width: 180.w,
            height: 18.h,
          ),

          8.verticalSpace,

          // 🔥 Address
          Row(
            children: [
              ShimmerWidget.circular(width: 24.w, height: 24.w),
              4.horizontalSpace,
              ShimmerWidget.rectangular(
                width: 140.w,
                height: 12.h,
              ),
            ],
          ),

          24.verticalSpace,

          // 🔥 Last booking avatars (fake stack)
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 160,
                child: Stack(
                  children: List.generate(4, (i) {
                    return Positioned(
                      left: i * 28.0,
                      child: ShimmerWidget.circular(
                        width: 40.w,
                        height: 40.w,
                      ),
                    );
                  }),
                ),
              ),

              8.horizontalSpace,

              ShimmerWidget.rectangular(
                width: 100.w,
                height: 12.h,
              ),
            ],
          ),

          24.verticalSpace,

          // 🔥 Tip cards
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(4, (i) {
              return ShimmerWidget.rectangular(
                width: 100.w,
                height: 34.h,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            }),
          ),

          24.verticalSpace,

          // 🔥 Description title
          ShimmerWidget.rectangular(
            width: 80.w,
            height: 14.h,
          ),

          8.verticalSpace,

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

class LastBookingPeople extends StatelessWidget {
  const LastBookingPeople({super.key, required this.users});
  final List<String>users;

  @override
  Widget build(BuildContext context) {
    final maxVisible = 4;
    final visibleUsers = users.take(maxVisible).toList();
    final remaining = users.length - visibleUsers.length;

    final isRTL = context.isEnglish;

    final stackWidth = (visibleUsers.length * 40);

    return Row(
      mainAxisSize: MainAxisSize.min,
      // textDirection: isRTL ? dir.TextDirection.rtl : dir.TextDirection.ltr,
      children: [
        SizedBox(
          width: stackWidth.toDouble(),
          height: 40,
          child: Stack(
            children: [
              ...visibleUsers.asMap().entries.map((entry) {
                int index = entry.key;
                var user = entry.value;

                return Positioned(
                  left: isRTL ? index * 30 : null,
                  right: isRTL ? null : index * 30,
                  child: AvatarImage(url: user),
                );
              }),

              if (remaining > 0)
                Positioned(
                  left: isRTL ? visibleUsers.length * 30 : null,
                  right: isRTL ? null : visibleUsers.length * 30,
                  child: RemainingAvatar(count: remaining),
                ),
            ],
          ),
        ),

        4.horizontalSpace,

       if(remaining!=0) Text(
          "+$remaining ${LocaleKeys.book.tr()}",
          style: AppTextTheme.bodyXSmall(context)
              .copyWith(color: AppColors.primary),
        ),
      ],
    );
  }

}

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin:4.padStart,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3),
      ),
      child: CircleImage(
        imageUrl:url
      ),
    );
  }
}

class RemainingAvatar extends StatelessWidget {
  const RemainingAvatar({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
        border: Border.all(color: AppColors.white, width: 3),
      ),
      child: Text(
        "+",
        style:AppTextTheme.bodyLarge(context).copyWith(height: 0,fontWeight: FontWeight.w700,color: AppColors.white)
      ),
    );
  }
}