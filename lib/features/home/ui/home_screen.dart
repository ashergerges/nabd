import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/constants/pull_refresh.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/home/cubit/home_cubit.dart';
import 'package:nawy/features/home/data/models/city_model.dart';
import 'package:nawy/features/home/ui/widgets/home_filter.dart';
import 'package:nawy/features/home/ui/widgets/home_slider.dart';
import 'package:nawy/features/home/ui/widgets/offer_card.dart';
import 'package:nawy/features/home/ui/widgets/vendors_card.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/utils/constants/size_manager.dart';
import '../../../gen/assets.gen.dart';
import '../data/models/filter_chip_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..homeData(),
      child: Column(
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
                        onTap:(){
                         NotificationRoute().push(context);
                        },
                          child: Assets.svg.notification.svg(height: 24.h)),
                      24.horizontalSpace,
                      Builder(
                        builder: (context) {
                          return OnTap(
                              onTap: (){
                                context.read<HomeCubit>().setShowedSearch(true);
                              },
                              child: Assets.svg.search.svg(height: 24.h));
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.currState is Loading) {
                  return HomeShimmer();
                }
                return SmartRefresher(
                  controller: state.refreshController,
                  onRefresh: () {
                    context.read<HomeCubit>().homeData();
                    state.refreshController.refreshCompleted();
                  },
                  header: PullRefresh.pullRefresh,
                  child: SingleChildScrollView(
                    padding: 16.padHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(state.showSearch)...[
                          24.verticalSpace,
                          AppTextField(label: LocaleKeys.search.tr(),
                            onChange: (value){
                              context.read<HomeCubit>().setSearchTerm(value);
                            },
                            suffixItem: OnTap(
                                onTap: (){
                                  context.read<HomeCubit>().setShowedSearch(false);
                                  context.read<HomeCubit>().setSearchTerm(null);
                                },
                                child: Padding(
                                  padding: 12.padTop,
                                  child: Text(LocaleKeys.cancel.tr(),style: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.neutral400),),
                                )),
                            imagePre: Assets.svg.search.path,radius: 12,),
                        ],
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
                                      name: e.name ?? '',
                                    ),
                                  )
                                  .toList() ??
                              [],
                          onSelected: (value) {
                            context.read<HomeCubit>().selectedCategory(value);
                          },
                          locations:(state.homeData?.cities ?? []).isEmpty
                              ? []
                              : [CityModel(id: 0, name: LocaleKeys.all.tr()),...(state.homeData?.cities ?? []), ],
                          onChangeLocation: (value) {
                            print('Selected id: $value');
                            context.read<HomeCubit>().selectedLocation(value);
                          },
                          selectedLocation: state.citySelected,
                          initial: state.categorySelected,
                        ),


                        if (state.homeData?.topRatedVendors?.isNotEmpty ??
                            false)...[
                          24.verticalSpace,
                          Text(
                            LocaleKeys.topRated.tr(),
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
                                return OnTap(
                                  onTap: (){
                                    VendorDetailsRoute(vendorDetailsId:state
                                        .homeData
                                        ?.topRatedVendors?[index]
                                            .id??0 ).push(context);
                                  },
                                  child: VendorsCard(
                                    width: SizeManager.widthFromScreen(
                                      1.4,
                                      context,
                                    ),
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
                                        .name ??
                                        "",
                                    location:
                                    state
                                        .homeData
                                        ?.topRatedVendors?[index]
                                        .address ??
                                        'الرياض',
                                    rate:
                                    state
                                        .homeData
                                        ?.topRatedVendors?[index]
                                        .avgRating ??
                                        0,
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext c, int i) =>
                              12.horizontalSpace,
                            ),
                          )
                        ],

                        if (state.homeData?.offers?.isNotEmpty ?? false)...[
                          24.verticalSpace,
                          Text(
                            LocaleKeys.specialOffers.tr(),
                            style: AppTextTheme.bodyLargeSemiBold(context),
                          ),
                          16.verticalSpace,

                          SizedBox(
                            height: 220.h,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.homeData?.offers?.length ?? 0,
                              itemBuilder: (BuildContext c, int index) {
                                return OnTap(
                                  onTap: (){
                                    VendorPackageDetailsRoute(vendorPackageId:state.homeData?.offers?[index].id??0 ).push(context);
                                  },
                                  child: OfferCard(

                                    imageUrl:
                                    state.homeData?.offers?[index].image ??
                                        AppStrings.kTestNetworkImage,
                                    packageName:
                                    state.homeData?.offers?[index].name ?? "",
                                    jobTitle:
                                    state
                                        .homeData
                                        ?.offers?[index]
                                        .productName ??
                                        "",
                                    discountPercentage:
                                    state
                                        .homeData
                                        ?.offers?[index]
                                        .discountPercentage ??
                                        "",
                                    personName: state
                                        .homeData
                                        ?.offers?[index]
                                        .vendorName??'',
                                    personImageUrl:  state
                                        .homeData
                                        ?.offers?[index]
                                        .vendorImage??AppStrings.kTestNetworkImage,
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext c, int i) =>
                              12.horizontalSpace,
                            ),
                          ),
                        ],


                        if (state.homeData?.weddingVenues?.isNotEmpty ?? false)...[
                          24.verticalSpace,
                          Text(
                            LocaleKeys.weddingHalls.tr(),
                            style: AppTextTheme.bodyLargeSemiBold(context),
                          ),
                          16.verticalSpace,
                          SizedBox(
                            height: 140.h,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                              state.homeData?.weddingVenues?.length ?? 0,
                              itemBuilder: (BuildContext c, int index) {
                                return OnTap(
                                  onTap: (){
                                    VendorDetailsRoute(vendorDetailsId:state
                                        .homeData
                                        ?.topRatedVendors?[index]
                                        .id??0 ).push(context);
                                  },
                                  child: VendorsCard(
                                    width: SizeManager.widthFromScreen(
                                      1.4,
                                      context,
                                    ),
                                    imageUrl:
                                    state
                                        .homeData
                                        ?.weddingVenues?[index]
                                        .image ??
                                        AppStrings.kTestNetworkImage,
                                    vendorName:
                                    state
                                        .homeData
                                        ?.weddingVenues?[index]
                                        .name ??
                                        "",
                                    location:
                                    state
                                        .homeData
                                        ?.weddingVenues?[index]
                                        .address ??
                                        '',
                                    rate:
                                    state
                                        .homeData
                                        ?.weddingVenues?[index]
                                        .avgRating ??
                                        0,
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext c, int i) =>
                              12.horizontalSpace,
                            ),
                          ),
                        ],

                        10.verticalSpace,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
          Text(
            LocaleKeys.topRated.tr(),
            style: AppTextTheme.bodyLargeSemiBold(context),
          ),
          16.verticalSpace,
          SizedBox(
            height: 140.h,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext c, int index) {
                return VendorsCardShimmer(
                  width: SizeManager.widthFromScreen(1.4, context),
                );
              },
              separatorBuilder: (BuildContext c, int i) => 12.horizontalSpace,
            ),
          ),
          24.verticalSpace,
          Text(LocaleKeys.specialOffers.tr(), style: AppTextTheme.bodyLargeSemiBold(context)),
          16.verticalSpace,
          SizedBox(
            height: 220.h,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext c, int i) {
                return OfferCardShimmer();
              },
              separatorBuilder: (BuildContext c, int i) => 12.horizontalSpace,
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
