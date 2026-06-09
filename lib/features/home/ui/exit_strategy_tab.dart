import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';
import 'package:nabd/features/home/data/models/company.dart';
import 'package:nabd/features/home/ui/section_box.dart';

import 'app_theme.dart';

class ExitStrategyTab extends StatelessWidget {
  const ExitStrategyTab({super.key});

  Color _readinessColor(int readiness) {
    if (readiness >= 70) return AppColors.success;
    if (readiness >= 50) return AppColors.warning;
    return AppColors.danger;
  }

  Color _rowBgColor(int readiness) {
    if (readiness >= 70) return AppColors.positiveLight;
    if (readiness >= 50) return AppColors.warningLight;
    return AppColors.negativeLight;
  }

  @override
  Widget build(BuildContext context) {
    final companies = PortfolioData.companies;
    final readyCount = companies.where((c) => c.readiness >= 70).length;
    final pct = ((readyCount / companies.length) * 100).toStringAsFixed(0);

    return SingleChildScrollView(
      padding: 100.padBottom + 16.padHorizontal,
      child: Column(
        children: [
          // Summary note
          Container(
            padding: 14.padAll,
            margin: 16.padBottom,
            decoration: BoxDecoration(
              color: AppColors.exitStrategy,
              borderRadius: AppRadius.card,
              border: Border.all(color: AppColors.barChartLinear),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color: AppColors.warning,
                  size: 20,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Text(
                    'ملاحظة استراتيجية: $pct% من المحفظة ($readyCount شركة) في مرحلة متقدمة من التخارج.',
                    textDirection: TextDirection.rtl,
                    style: AppTextTheme.bodySmall(
                      context,
                    ).copyWith(color: AppColors.textDark),
                  ),
                ),
              ],
            ),
          ),
          // Company exit cards
          SectionBox(
            icon: Icons.exit_to_app,
            title: 'استراتيجيات التخارج & مرحلة النضج',
            child: Column(
              children: companies.map((c) {
                return Container(
                  margin: 10.padBottom,
                  padding: 14.padAll,
                  decoration: BoxDecoration(
                    color: _rowBgColor(c.readiness),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.barChartLinear),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            c.name,
                            textDirection: TextDirection.rtl,
                            style: AppTextTheme.bodySmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                          Container(
                            padding: 10.padHorizontal + 4.padVertical,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: AppRadius.chip,
                            ),
                            child: Text(
                              c.exitStrategy,
                              style: AppTextTheme.bodyXXSmall(context).copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 13,
                                color: AppColors.textMuted,
                              ),
                              4.horizontalSpace,
                              Text(
                                c.exitTiming,
                                style: AppTextTheme.bodyXXSmall(context)
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textMuted,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            c.readiness >= 70
                                ? 'جاهزية عالية'
                                : (c.readiness >= 50
                                      ? 'تجهيز مستمر'
                                      : 'جاهزية منخفضة'),
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              color: _readinessColor(c.readiness),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      6.verticalSpace,
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            '${c.readiness}%',
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              color: _readinessColor(c.readiness),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: LinearProgressIndicator(
                                value: c.readiness / 100,
                                backgroundColor: Colors.white.withOpacity(0.6),
                                valueColor: AlwaysStoppedAnimation(
                                  _readinessColor(c.readiness),
                                ),
                                minHeight: 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          // Sector table
          SectionBox(
            icon: Icons.table_chart_outlined,
            title: 'توزيع المحفظة حسب القطاع',
            child: Column(
              children: [
                // Header
                Container(
                  padding: 12.padHorizontal + 8.padVertical,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children:  [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'القطاع',
                          textDirection: TextDirection.rtl,
                          style:AppTextTheme.bodyXXSmall(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'شركات',
                          textAlign: TextAlign.center,
                          style:AppTextTheme.bodyXXSmall(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'عادلة',
                          textAlign: TextAlign.center,
                          style:AppTextTheme.bodyXXSmall(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'الوزن',
                          textAlign: TextAlign.center,
                          style:AppTextTheme.bodyXXSmall(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...PortfolioData.sectorStats.entries.map((e) {
                  final pct =
                      (e.value['fairValue'] as double) /
                      PortfolioData.totalFairValue;
                  return Container(
                    padding:9.padVertical+12.padHorizontal,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.exitStrategyTap),
                      ),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            e.key,
                            textDirection: TextDirection.rtl,
                            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w400,
    color: AppColors.textDark,),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${e.value['count']}',
                            textAlign: TextAlign.center,
                            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w400,
                              color: AppColors.textDark,),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${(e.value['fairValue'] as double).toInt()}M',
                            textAlign: TextAlign.center,
                            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w400,
                              color: AppColors.textDark,),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${(pct * 100).toStringAsFixed(1)}%',
                            textAlign: TextAlign.center,
                            style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.success,
                              fontWeight: FontWeight.w700,),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
