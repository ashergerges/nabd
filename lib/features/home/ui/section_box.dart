import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';

import 'app_theme.dart';

class SectionBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const SectionBox({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 16.padBottom,
      padding: 16.padAll,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.exitStrategyTap),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 4,
                height: 22,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              10.horizontalSpace,
              Icon(icon, color: AppColors.primary, size: 18),
              6.horizontalSpace,
              Text(
                title,
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          14.verticalSpace,
          child,
        ],
      ),
    );
  }
}
