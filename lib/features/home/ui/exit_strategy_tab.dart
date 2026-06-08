import 'package:flutter/material.dart';
import 'package:nabd/features/home/ui/company.dart';
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
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
      child: Column(
        children: [
          // Summary note
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9E6),
              borderRadius: AppRadius.card,
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(Icons.lightbulb_outline,
                    color: AppColors.warning, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'ملاحظة استراتيجية: $pct% من المحفظة ($readyCount شركة) في مرحلة متقدمة من التخارج.',
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.body.copyWith(fontSize: 13),
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
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _rowBgColor(c.readiness),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
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
                            style: AppTextStyles.heading.copyWith(fontSize: 13),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: AppRadius.chip,
                            ),
                            child: Text(
                              c.exitStrategy,
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              const Icon(Icons.calendar_today_outlined,
                                  size: 13, color: AppColors.textMuted),
                              const SizedBox(width: 4),
                              Text(c.exitTiming, style: AppTextStyles.label),
                            ],
                          ),
                          Text(
                            c.readiness >= 70
                                ? 'جاهزية عالية'
                                : (c.readiness >= 50
                                    ? 'تجهيز مستمر'
                                    : 'جاهزية منخفضة'),
                            style: TextStyle(
                              color: _readinessColor(c.readiness),
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            '${c.readiness}%',
                            style: TextStyle(
                              color: _readinessColor(c.readiness),
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: LinearProgressIndicator(
                                value: c.readiness / 100,
                                backgroundColor: Colors.white.withOpacity(0.6),
                                valueColor: AlwaysStoppedAnimation(
                                    _readinessColor(c.readiness)),
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Expanded(
                          flex: 2,
                          child: Text('القطاع',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700))),
                      Expanded(
                          child: Text('شركات',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700))),
                      Expanded(
                          child: Text('عادلة',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700))),
                      Expanded(
                          child: Text('الوزن',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700))),
                    ],
                  ),
                ),
                ...PortfolioData.sectorStats.entries.map((e) {
                  final pct =
                      (e.value['fairValue'] as double) / PortfolioData.totalFairValue;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 9, horizontal: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Color(0xFFEEF2FA))),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(e.key,
                              textDirection: TextDirection.rtl,
                              style: AppTextStyles.body.copyWith(fontSize: 12)),
                        ),
                        Expanded(
                          child: Text(
                            '${e.value['count']}',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.body.copyWith(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${(e.value['fairValue'] as double).toInt()}M',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.body.copyWith(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${(pct * 100).toStringAsFixed(1)}%',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.success,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
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
