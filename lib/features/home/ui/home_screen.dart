import 'package:flutter/material.dart';
import 'package:nabd/features/home/ui/chatbot_fab.dart';
import 'package:nabd/features/home/ui/company.dart';
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
                    const SizedBox(height: 20),
                    // KPI Cards Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            subtitle:
                            '+${((totalFair / totalBook - 1) * 100).toStringAsFixed(0)}%',
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
                    const SizedBox(height: 16),
                    // Tab selector
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _TabSelector(
                        currentIndex: _currentIndex,
                        onChanged: (i) => setState(() => _currentIndex = i),
                      ),
                    ),
                    const SizedBox(height: 16),
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
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.card,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isActive = i == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                    const SizedBox(width: 6),
                    Text(
                      tabs[i]['label'] as String,
                      style: TextStyle(
                        color: isActive ? Colors.white : AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
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
