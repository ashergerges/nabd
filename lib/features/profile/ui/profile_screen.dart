import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../main_common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(
            child: Padding(
              padding: 10.padBottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.svg.logoName.svg(height: 30.h),
                  OnTap(
                    onTap: (){
                      UpdateProfileRoute().push(context).then((value){
                        context.router.replaceAll([
                          HomeBottomTabsRoute(index: 3),
                        ], updateExistingRoutes: false);
                      });
                    },
                    child: Container(
                      padding: 5.padAll,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Assets.svg.edit.svg(height: 24.h),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: 24.padHorizontal + 24.padTop,
              child: Column(
                children: [
                  ProfileInfoCard(),
                  40.verticalSpace,
                  ProfileItem(
                    title: LocaleKeys.location.tr(),
                    imageUrl: Assets.svg.location.path,
                    onTap: () {
                      LocationRoute().push(context);
                    },
                  ),
                  ProfileDiv(),
                  ProfileItem(
                    title: LocaleKeys.favorites.tr(),
                    imageUrl: Assets.svg.favouriteSquare.path,
                    onTap: () {
                      FavRoute().push(context);
                    },
                  ),
                  ProfileDiv(),
                  ProfileItem(
                    title: LocaleKeys.language.tr(),
                    imageUrl: Assets.svg.language.path,
                    onTap: () {
                      LanguageRoute().push(context);
                    },
                  ),
                  ProfileDiv(),
                  ProfileItem(
                    title: LocaleKeys.trackInvitations.tr(),
                    imageUrl: Assets.svg.invitationTracker.path,
                    onTap: () {
                      InvitationTrackingRoute().push(context);
                    },
                  ),
                  ProfileDiv(),
                  ProfileItem(
                    title:LocaleKeys.support.tr(),
                    imageUrl: Assets.svg.support.path,
                    onTap: () {
                      SupportRoute().push(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: 24.padHorizontal+24.padBottom,
            child: OnTap(
              onTap: (){
                LoginRoute().push(context);
              },
              child: Row(
                children: [
                  SvgPicture.asset(Assets.svg.logout.path, height: 32.h),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                        LocaleKeys.logout.tr(), style: AppTextTheme.headingSmall(context).copyWith(color: AppColors.error)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileDiv extends StatelessWidget {
  const ProfileDiv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 20.padVertical,
      color: AppColors.primary100,
      height: 1,
      width: double.infinity,
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(imageUrl, height: 32.h),
          24.horizontalSpace,
          Expanded(
            child: Text(title, style: AppTextTheme.headingSmall(context)),
          ),
          Icon(Icons.arrow_forward_ios, size: 24.h, color: AppColors.primary),
        ],
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleImage(imageUrl: getIt<ILocalPreference>().appUser.value?.image??AppStrings.kTestNetworkImage, size: 100.h),
        12.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getIt<ILocalPreference>().appUser.value?.name??"",
              style: AppTextTheme.headingSmall(
                context,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
            8.verticalSpace,
            Row(
              children: [
                Assets.svg.location.svg(height: 20.h),
                2.horizontalSpace,
                Text(
                  getIt<ILocalPreference>().appUser.value?.address??"",
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.textColor,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                Assets.svg.phone.svg(height: 20.h),
                2.horizontalSpace,
                Text(
                  getIt<ILocalPreference>().appUser.value?.phone??"",
                  style: AppTextTheme.bodyXSmall(context),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
