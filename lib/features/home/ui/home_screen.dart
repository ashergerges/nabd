import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';
import 'package:nabd/features/home/ui/chatbot_fab.dart';
import 'package:nabd/features/home/data/models/company.dart';
import 'package:nabd/features/home/ui/hero_header.dart';
import 'package:nabd/features/home/ui/kpi_card.dart';
import 'app_theme.dart';
import 'charts_tab.dart';
import 'companies_tab.dart';
import 'exit_strategy_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final totalBook = PortfolioData.totalBookValue;
    final totalFair = PortfolioData.totalFairValue;
    final totalCreated = PortfolioData.totalValueCreated;
    final totalExpected = PortfolioData.totalExpectedExit;
    final sectors = PortfolioData.sectorStats;
    final companies = PortfolioData.companies;

    final largestSector = sectors.entries
        .reduce((a, b) => (a.value['fairValue'] as double) >
        (b.value['fairValue'] as double)
        ? a
        : b)
        .key;

    final avgOwnership =
    (companies.fold(0, (s, c) => s + c.ownership) / companies.length)
        .round();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main scrollable content
          CustomScrollView(
            slivers: [
              // Hero header (always visible)
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const HeroHeader(),
                    20.verticalSpace,
                    // KPI Cards Grid
                    Padding(
                      padding: 16.padHorizontal,
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                        children: [
                          KpiCard(
                            icon: Icons.business,
                            label: 'الشركات',
                            value: '${companies.length}',
                          ),
                          KpiCard(
                            icon: Icons.book_outlined,
                            label: 'دفترية',
                            value: '${totalBook.toInt()}M\$',
                          ),
                          KpiCard(
                            icon: Icons.bar_chart,
                            label: 'عادلة',
                            value: '${totalFair.toInt()}M\$',
                            // subtitle: '+${((totalFair / totalBook - 1) * 100).toStringAsFixed(0)}%',
                          ),
                          KpiCard(
                            icon: Icons.trending_up,
                            label: 'متوقعة',
                            value: '${totalExpected.toInt()}M\$',
                          ),
                          KpiCard(
                            icon: Icons.diamond_outlined,
                            label: 'خلق القيمة',
                            value: '+${totalCreated.toInt()}M\$',
                            valueColor: AppColors.emerald,
                          ),
                          KpiCard(
                            icon: Icons.percent,
                            label: 'العائد',
                            value:
                            '${((totalCreated / totalBook) * 100).toStringAsFixed(0)}%',
                            valueColor: AppColors.success,
                          ),
                          KpiCard(
                            icon: Icons.pie_chart_outline,
                            label: 'أكبر قطاع',
                            value: largestSector,
                          ),
                          KpiCard(
                            icon: Icons.handshake_outlined,
                            label: 'متوسط الملكية',
                            value: '$avgOwnership%',
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    // Tab selector
                    Padding(
                      padding: 16.padHorizontal,
                      child: _TabSelector(
                        currentIndex: _currentIndex,
                        onChanged: (i) => setState(() => _currentIndex = i),
                      ),
                    ),
                    16.verticalSpace
                  ],
                ),
              ),
              // Tab content
              SliverFillRemaining(
                hasScrollBody: true,
                child: _buildTab(),
              ),
            ],
          ),
          // Chatbot FAB overlay
          const Positioned.fill(child: ChatbotFab()),
        ],
      ),
    );
  }

  Widget _buildTab() {
    switch (_currentIndex) {
      case 0:
        return const ChartsTab();
      case 1:
        return const CompaniesTab();
      case 2:
        return const ExitStrategyTab();
      default:
        return const ChartsTab();
    }
  }
}

class _TabSelector extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onChanged;

  const _TabSelector({required this.currentIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'icon': Icons.bar_chart, 'label': 'المخططات'},
      {'icon': Icons.business_outlined, 'label': 'الشركات'},
      {'icon': Icons.exit_to_app, 'label': 'التخارج'},
    ];

    return Container(
      padding: 4.padAll,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.card,
        border: Border.all(color:  AppColors.barChartLinear),
      ),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isActive = i == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:10.padVertical,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      tabs[i]['icon'] as IconData,
                      size: 16,
                      color: isActive ? Colors.white : AppColors.textMuted,
                    ),
                    6.horizontalSpace,
                    Text(
                      tabs[i]['label'] as String,
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: isActive ? Colors.white : AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
