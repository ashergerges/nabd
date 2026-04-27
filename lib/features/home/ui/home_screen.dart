import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/home/cubit/home_cubit.dart';
import 'package:nawy/features/home/ui/widgets/home_filter.dart';
import 'package:nawy/features/home/ui/widgets/home_slider.dart';
import 'package:nawy/features/home/ui/widgets/location_selector.dart';
import 'package:nawy/features/home/ui/widgets/offer_card.dart';
import 'package:nawy/features/home/ui/widgets/vendors_card.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/size_manager.dart';
import '../../../gen/assets.gen.dart';
import '../data/models/filter_chip_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBar(
          child: Padding(
            padding: 10.padBottom,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.svg.logoName.svg(height: 30.h),
                Row(
                  children: [
                    OnTap(
                      onTap: () {
                        CreateInvitationRoute().push(context);
                      },
                      child: Assets.svg.search.svg(height: 24.h),
                    ),
                    24.horizontalSpace,
                    Assets.svg.search.svg(height: 24.h),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: BlocProvider(
            create: (context) => HomeCubit()..homeData(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if(state.currState is Loading){
                  return HomeShimmer();
                }
                return SingleChildScrollView(
                  padding: 16.padHorizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      24.verticalSpace,
                      HomeSlider(
                        imageUrls:
                            state.homeData?.sliders
                                ?.map((e) => e.image ?? "")
                                .toList() ??
                            [],
                      ),
                      24.verticalSpace,
                      FilterChipBar(
                        items:
                            state.homeData?.categories
                                ?.map(
                                  (e) => FilterChipModel(
                                    id: e.id ?? 0,
                                    name: e.nameAr ?? 'قاعة الزفاف',
                                  ),
                                )
                                .toList() ??
                            [],
                        onSelected: (id) {
                          // id == 0 → "All" was tapped
                          print('Selected id: $id');
                        },
                      ),

                      24.verticalSpace,
                      Text(
                        "الأعلى تقييمًا",
                        style: AppTextTheme.bodyLargeSemiBold(context),
                      ),
                      16.verticalSpace,
                      SizedBox(
                        height: 140.h,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              state.homeData?.topRatedVendors?.length ?? 0,
                          itemBuilder: (BuildContext c, int index) {
                            return VendorsCard(
                              width: SizeManager.widthFromScreen(1.4, context),
                              imageUrl:
                                  state
                                      .homeData
                                      ?.topRatedVendors?[index]
                                      .image ??
                                  AppStrings.kTestNetworkImage,
                              vendorName:
                                  state
                                      .homeData
                                      ?.topRatedVendors?[index]
                                      .nameAr ??
                                  "",
                              location:
                                  state
                                      .homeData
                                      ?.topRatedVendors?[index]
                                      .descriptionAr ??
                                  'الرياض',
                              rate:
                                  state
                                      .homeData
                                      ?.topRatedVendors?[index]
                                      .avgRating ??
                                  0,
                            );
                          },
                          separatorBuilder: (BuildContext c, int i) =>
                              12.horizontalSpace,
                        ),
                      ),
                      24.verticalSpace,
                      Text(
                        "عروض خاصة",
                        style: AppTextTheme.bodyLargeSemiBold(context),
                      ),
                      16.verticalSpace,
                      SizedBox(
                        height: 220.h,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext c, int i) {
                            return OfferCard(
                              imageUrl: AppStrings.kTestNetworkImage,
                              packageName: 'باقة العروس\nالملكية',
                              jobTitle: 'خبيرة مكياج',
                              personName: 'هبة سليمة',
                              personImageUrl: AppStrings.kTestNetworkImage,
                            );
                          },
                          separatorBuilder: (BuildContext c, int i) =>
                              12.horizontalSpace,
                        ),
                      ),
                      10.verticalSpace,
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.padHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          HomeSliderShimmer(),
          24.verticalSpace,
          FilterChipBarShimmer(),

          24.verticalSpace,
          Text("الأعلى تقييمًا",style: AppTextTheme.bodyLargeSemiBold(context),),
          16.verticalSpace,
          SizedBox(
            height: 140.h,
            child: ListView.separated(
              physics:BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext c, int index) {
                return VendorsCardShimmer(
                  width: SizeManager.widthFromScreen(1.4, context),
                );
              },
              separatorBuilder:(BuildContext c, int i) => 12.horizontalSpace,
            ),
          ),
          24.verticalSpace,
          Text("عروض خاصة",style: AppTextTheme.bodyLargeSemiBold(context),),
          16.verticalSpace,
          SizedBox(
            height: 220.h,
            child: ListView.separated(
              physics:BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext c, int i) {
                return OfferCardShimmer();
              },
              separatorBuilder:(BuildContext c, int i) => 12.horizontalSpace,
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
