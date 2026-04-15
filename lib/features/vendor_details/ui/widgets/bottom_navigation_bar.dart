import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/locale_keys.g.dart';
class VendorBottomNavigationBar extends StatelessWidget {
  const VendorBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: AppButton(
        text: LocaleKeys.contactServiceProvider.tr(),
      ),
    );
  }
}
