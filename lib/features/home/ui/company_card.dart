import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';
import 'package:nabd/features/home/data/models/company.dart';

import 'app_theme.dart';

class CompanyCard extends StatelessWidget {
  final Company company;

  const CompanyCard({super.key, required this.company});

  Color get _recBackgroundColor {
    switch (company.recommendationType) {
      case RecommendationType.positive:
        return AppColors.positiveLight;
      case RecommendationType.warning:
        return AppColors.warningLight;
      case RecommendationType.negative:
        return AppColors.negativeLight;
    }
  }

  Color get _recBorderColor {
    switch (company.recommendationType) {
      case RecommendationType.positive:
        return AppColors.success;
      case RecommendationType.warning:
        return AppColors.warning;
      case RecommendationType.negative:
        return AppColors.danger;
    }
  }

  Color get _readinessColor {
    if (company.readiness >= 70) return AppColors.success;
    if (company.readiness >= 50) return AppColors.warning;
    return AppColors.danger;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 12.padBottom,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColors.barChartLinear),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: 16.padHorizontal + 12.padVertical,
            decoration: const BoxDecoration(
              color: AppColors.bgHeaderCompanyCard,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    company.name,
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Container(
                  padding: 10.padHorizontal + 4.padVertical,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: AppRadius.chip,
                  ),
                  child: Text(
                    company.sector,
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Stats row
          Padding(
            padding: 16.padHorizontal + 10.padVertical,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                _StatChip(
                    label: 'دفترية', value: '${company.bookValue.toInt()}M\$'),
                8.horizontalSpace,
                _StatChip(
                    label: 'عادلة', value: '${company.fairValue.toInt()}M\$'),
                8.horizontalSpace,
                _StatChip(
                  label: 'خلق القيمة',
                  value: '+${company.valueCreated.toInt()}M\$',
                  valueColor: AppColors.emerald,
                ),
                8.horizontalSpace,
                _StatChip(
                  label: 'العائد',
                  value: '${company.roi.toStringAsFixed(0)}%',
                  valueColor: AppColors.success,
                ),
              ],
            ),
          ),
          // Readiness bar
          Padding(
            padding: 16.padHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'جاهزية التخارج',
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textMuted,
                      ),
                    ),
                    Text(
                        '${company.readiness}%',
                        style: AppTextTheme.bodySmall(context).copyWith(
                          color: _readinessColor,
                          fontWeight: FontWeight.w800,
                        )
                    ),
                  ],
                ),
                6.verticalSpace,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: company.readiness / 100,
                    backgroundColor: AppColors.barChartLinear,
                    valueColor: AlwaysStoppedAnimation(_readinessColor),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          // Recommendation
          Container(
            margin: 14.padBottom + 16.padHorizontal,
            padding: 10.padAll,
            decoration: BoxDecoration(
              color: _recBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border(
                right: BorderSide(color: _recBorderColor, width: 3),
              ),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        company.recommendationText,
                        style: AppTextTheme.bodySmall(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        company.recommendationAction,
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMuted,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
                8.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      company.exitStrategy,
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      company.exitTiming,
                      style:AppTextTheme.bodyXXSmall(context).copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _StatChip({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:6.padVertical+4.padHorizontal,
        decoration: BoxDecoration(
          color:  AppColors.bgQuickQuestions,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style:AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w800,
                color: valueColor ?? AppColors.textDark,
              ),
            ),
            Text(
              label,
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
