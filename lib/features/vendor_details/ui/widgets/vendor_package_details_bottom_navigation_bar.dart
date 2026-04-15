import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/locale_keys.g.dart';


class VendorPackageDetailsBottomNavigationBar extends StatelessWidget {
  const VendorPackageDetailsBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                              text: "1,500",
                              style: AppTextTheme.headingXLargeBold(context).copyWith(fontWeight: FontWeight.w700,color: AppColors.primary)
                          ),
                          TextSpan(
                              text: LocaleKeys.sar.tr(),
                              style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.primary)
                          ),
                        ],
                      ),
                    ),
                    Text("2,500 ${LocaleKeys.riyal.tr()}",
                        style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w300,decorationColor: AppColors.primary,decoration: TextDecoration.lineThrough,color: AppColors.primary)
                    )
                  ],
                ),
              ),
              Expanded(child: AppButton(text: LocaleKeys.bookNow.tr(),))
            ],
          ),
        ],
      ),
    );
  }
}