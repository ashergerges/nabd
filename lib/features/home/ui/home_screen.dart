import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/router/app_router.dart';
import 'package:nabd/core/utils/common_widgets/app_text_field.dart';
import 'package:nabd/core/utils/common_widgets/custom_appbar.dart';
import 'package:nabd/core/utils/common_widgets/on_tap.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/constants/constants.dart';
import 'package:nabd/core/utils/constants/pull_refresh.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';
import 'package:nabd/features/home/cubit/home_cubit.dart';
import 'package:nabd/features/home/data/models/city_model.dart';
import 'package:nabd/features/home/ui/widgets/home_filter.dart';
import 'package:nabd/features/home/ui/widgets/home_slider.dart';
import 'package:nabd/features/home/ui/widgets/offer_card.dart';
import 'package:nabd/features/home/ui/widgets/vendors_card.dart';
import 'package:nabd/gen/locale_keys.g.dart';
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
