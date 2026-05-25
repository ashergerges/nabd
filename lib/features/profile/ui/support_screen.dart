import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/profile/ui/widgets/social_media_row.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nawy/main_common.dart';

@RoutePage()
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.support.tr()),
      body: Padding(
        padding: 15.padAll,
        child: Column(
          children: [
            15.verticalSpace,
            OnTap(
              onTap: () {
                UrlLauncher.shareToWhatsApp(getIt<ILocalPreference>().support.value?.phone??"",message: LocaleKeys.hello.tr());

              },
              child: Container(
                padding: 16.padHorizontal + 12.padVertical,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.neutral50),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svg.whatsIcon.path,
                      height: 40.h,
                      width: 40.w,
                      color: AppColors.secondary800,
                    ),
                    14.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.contactViaWhatsapp.tr(),
                          style: AppTextTheme.bodyMedium(context),
                        ),
                        4.verticalSpace,
                        Text(
                          LocaleKeys.sendUsOverWhatsapp.tr(),
                            style: AppTextTheme.bodySmall(context)
                              .copyWith(color: AppColors.neutral400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Ionicons.chevron_back,
                      color: AppColors.neutral900,
                      size: 20.r,
                    ),
                  ],
                ),
              ),
            ),
            40.verticalSpace,
            const SocialMediaRow(),
          ],
        ),
      ),
    );

  }
}
