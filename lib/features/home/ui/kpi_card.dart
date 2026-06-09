import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';

import 'app_theme.dart';

class KpiCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String? subtitle;
  final Color? valueColor;

  const KpiCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.subtitle,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:16.padVertical+8.padHorizontal,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color:  AppColors.barChartLinear),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 26),
          6.verticalSpace,
          Text(
            label,
            style: AppTextTheme.bodyXXSmall(context).copyWith(
                  fontWeight: FontWeight.w700,
    color: AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
          4.verticalSpace,
          Text(
            value,
            style:AppTextTheme.bodyMedium(context).copyWith(
              color: valueColor ?? AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ),
    );
  }
}
