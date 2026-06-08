import 'package:flutter/material.dart';
import 'package:nabd/features/home/ui/company.dart';
import 'package:nabd/features/home/ui/section_box.dart';
import 'app_theme.dart';

class ChartsTab extends StatelessWidget {
  const ChartsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final companies = PortfolioData.companies;
    final sectors = PortfolioData.sectorStats;
    final totalFair = PortfolioData.totalFairValue;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
      child: Column(
        children: [
          // 1. Sector Distribution
          SectionBox(
            icon: Icons.pie_chart_outline,
            title: 'توزيع المحفظة حسب القطاع',
            child: _SectorBarChart(sectors: sectors, totalFair: totalFair),
          ),
          // 2. Book / Fair / Expected comparison
          SectionBox(
            icon: Icons.bar_chart,
            title: 'دفترية / عادلة / متوقعة',
            child: _ValueComparisonChart(
              bookTotal: PortfolioData.totalBookValue,
              fairTotal: totalFair,
              expectedTotal: PortfolioData.totalExpectedExit,
            ),
          ),
          // 3. Value Creation per company
          SectionBox(
            icon: Icons.trending_up,
            title: 'خلق القيمة حسب الشركة',
            child: _HorizontalBarChart(
              items: [...companies]
                ..sort((a, b) => b.valueCreated.compareTo(a.valueCreated)),
              getValue: (c) => c.valueCreated,
              label: 'خلق القيمة (M\$)',
              color: AppColors.success,
            ),
          ),
          // 4. Exit value per company
          SectionBox(
            icon: Icons.exit_to_app,
            title: 'القيمة المتوقعة عند التخارج',
            child: _HorizontalBarChart(
              items: [...companies]
                ..sort((a, b) => b.expectedExit.compareTo(a.expectedExit)),
              getValue: (c) => c.expectedExit,
              label: 'القيمة عند التخارج (M\$)',
              color: AppColors.warning,
            ),
          ),
          // 5. Forecast line chart
          SectionBox(
            icon: Icons.show_chart,
            title: 'تطور المحفظة 2026–2030',
            child: _ForecastChart(baseFair: totalFair),
          ),
        ],
      ),
    );
  }
}

class _SectorBarChart extends StatelessWidget {
  final Map<String, Map<String, dynamic>> sectors;
  final double totalFair;

  const _SectorBarChart({required this.sectors, required this.totalFair});

  static const _colors = [
    Color(0xFF0A2A3A),
    Color(0xFF1E5A8A),
    Color(0xFF2E7AB0),
    Color(0xFF4A9AC0),
    Color(0xFF6AB0D0),
    Color(0xFF8CC5DB),
  ];

  @override
  Widget build(BuildContext context) {
    final entries = sectors.entries.toList();
    return Column(
      children: List.generate(entries.length, (i) {
        final s = entries[i];
        final pct = (s.value['fairValue'] as double) / totalFair;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.key,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.body.copyWith(fontSize: 13)),
                  Text(
                    '${(s.value['fairValue'] as double).toInt()}M\$ (${(pct * 100).toStringAsFixed(0)}%)',
                    style: AppTextStyles.label,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: pct,
                  backgroundColor: const Color(0xFFE2E8F0),
                  valueColor:
                      AlwaysStoppedAnimation(_colors[i % _colors.length]),
                  minHeight: 10,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _ValueComparisonChart extends StatelessWidget {
  final double bookTotal;
  final double fairTotal;
  final double expectedTotal;

  const _ValueComparisonChart({
    required this.bookTotal,
    required this.fairTotal,
    required this.expectedTotal,
  });

  @override
  Widget build(BuildContext context) {
    final maxVal = expectedTotal;
    final bars = [
      {'label': 'دفترية', 'value': bookTotal, 'color': const Color(0xFF4A6A8A)},
      {'label': 'عادلة', 'value': fairTotal, 'color': AppColors.primary},
      {'label': 'متوقعة', 'value': expectedTotal, 'color': AppColors.primaryDark},
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: bars.map((b) {
        final pct = (b['value'] as double) / maxVal;
        return Column(
          children: [
            Text(
              '${(b['value'] as double).toInt()}M',
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  color: AppColors.textDark),
            ),
            const SizedBox(height: 4),
            Container(
              width: 56,
              height: 120 * pct,
              decoration: BoxDecoration(
                color: b['color'] as Color,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8)),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              b['label'] as String,
              style: AppTextStyles.label.copyWith(fontSize: 12),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _HorizontalBarChart extends StatelessWidget {
  final List<Company> items;
  final double Function(Company) getValue;
  final String label;
  final Color color;

  const _HorizontalBarChart({
    required this.items,
    required this.getValue,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final maxVal = items.fold(0.0, (m, c) => getValue(c) > m ? getValue(c) : m);
    return Column(
      children: items.map((c) {
        final pct = maxVal > 0 ? getValue(c) / maxVal : 0.0;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  c.name.length > 14
                      ? '${c.name.substring(0, 12)}..'
                      : c.name,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.label.copyWith(fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: pct,
                    backgroundColor: const Color(0xFFE2E8F0),
                    valueColor: AlwaysStoppedAnimation(color),
                    minHeight: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${getValue(c).toInt()}M',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _ForecastChart extends StatelessWidget {
  final double baseFair;

  const _ForecastChart({required this.baseFair});

  @override
  Widget build(BuildContext context) {
    final years = ['2026', '2027', '2028', '2029', '2030'];
    final values = [
      baseFair,
      baseFair * 1.18,
      baseFair * 1.18 * 1.18,
      baseFair * 1.18 * 1.18 * 1.18,
      baseFair * 1.18 * 1.18 * 1.18 * 1.18,
    ];
    final maxVal = values.last;

    return Column(
      children: [
        SizedBox(
          height: 140,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (i) {
              final pct = values[i] / maxVal;
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${values[i].toInt()}',
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 40,
                    height: 100 * pct,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withOpacity(0.3),
                          AppColors.primary,
                        ],
                      ),
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6)),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: years.map((y) => Text(y, style: AppTextStyles.label)).toList(),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('نمو سنوي متوقع: 18%',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.label),
              Text(
                '2030: ${values.last.toInt()}M\$',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
