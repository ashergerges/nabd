import 'package:flutter/material.dart';
import 'package:nabd/features/home/ui/company.dart';

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
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: const Color(0xFFE2E8F0)),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    company.name,
                    style: AppTextStyles.heading.copyWith(fontSize: 14),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: AppRadius.chip,
                  ),
                  child: Text(
                    company.sector,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Stats row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                _StatChip(
                    label: 'دفترية', value: '${company.bookValue.toInt()}M\$'),
                const SizedBox(width: 8),
                _StatChip(
                    label: 'عادلة', value: '${company.fairValue.toInt()}M\$'),
                const SizedBox(width: 8),
                _StatChip(
                  label: 'خلق القيمة',
                  value: '+${company.valueCreated.toInt()}M\$',
                  valueColor: AppColors.emerald,
                ),
                const SizedBox(width: 8),
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'جاهزية التخارج',
                      style: AppTextStyles.label,
                    ),
                    Text(
                      '${company.readiness}%',
                      style: TextStyle(
                        color: _readinessColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: company.readiness / 100,
                    backgroundColor: const Color(0xFFE2E8F0),
                    valueColor: AlwaysStoppedAnimation(_readinessColor),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Recommendation
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            padding: const EdgeInsets.all(10),
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
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w700, fontSize: 12),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        company.recommendationAction,
                        style: AppTextStyles.label,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      company.exitStrategy,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      company.exitTiming,
                      style:
                          AppTextStyles.label.copyWith(color: AppColors.textMuted),
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
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: valueColor ?? AppColors.textDark,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
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
