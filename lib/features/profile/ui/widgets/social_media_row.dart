import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:nawy/main_common.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: AppColors.neutral100)),
            8.horizontalSpace,
            Text(
              LocaleKeys.orFlowUs.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.neutral400,
              ),
            ),
            8.horizontalSpace,
            const Expanded(child: Divider(color: AppColors.neutral100)),
          ],
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnTap(
              onTap: () {
                UrlLauncher.openWebInApp(getIt<ILocalPreference>().support.value?.twitterLink??"");

              },
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8.r),
                child: SvgPicture.asset(
                  Assets.svg.xTwitter.path,
                  height: 30.h,
                  colorFilter: ColorFilter.mode(Colors.grey.shade700, BlendMode.srcOut),
                ),
              ),
            ),
            16.horizontalSpace,
            OnTap(
              onTap: () {
                UrlLauncher.openWebInApp(getIt<ILocalPreference>().support.value?.instagramLink??"");
              },
              child: SvgPicture.asset(
                Assets.svg.instagramLogo.path,
                height: 30.h,
              ),
            ),
            16.horizontalSpace,
            OnTap(
              onTap: () {
                UrlLauncher.openWebInApp(getIt<ILocalPreference>().support.value?.tiktokLink??"");

              },
              child: SvgPicture.asset(
                Assets.svg.tiktokComLogo.path,
                height: 30.h,
              ),
            ),
            16.horizontalSpace,
            OnTap(
              onTap: () {
                UrlLauncher.openWebInApp(getIt<ILocalPreference>().support.value?.snapchatLink??"");

              },
              child: SvgPicture.asset(
                Assets.svg.snapchatLogo.path,
                height: 30.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
