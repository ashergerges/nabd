import 'package:flutter/material.dart';
import 'package:nabd/features/home/ui/company.dart';
import 'package:nabd/features/home/ui/company_card.dart';

import 'app_theme.dart';


class CompaniesTab extends StatefulWidget {
  const CompaniesTab({super.key});

  @override
  State<CompaniesTab> createState() => _CompaniesTabState();
}

class _CompaniesTabState extends State<CompaniesTab> {
  String _filter = 'all';

  List<Company> get _filtered {
    if (_filter == 'all') return PortfolioData.companies;
    return PortfolioData.companies.where((c) {
      if (_filter == 'positive') return c.recommendationType == RecommendationType.positive;
      if (_filter == 'warning') return c.recommendationType == RecommendationType.warning;
      if (_filter == 'negative') return c.recommendationType == RecommendationType.negative;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter chips
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                _FilterChip(
                    label: 'جميع الشركات',
                    value: 'all',
                    current: _filter,
                    onTap: (v) => setState(() => _filter = v)),
                const SizedBox(width: 8),
                _FilterChip(
                    label: '🟢 إيجابية',
                    value: 'positive',
                    current: _filter,
                    onTap: (v) => setState(() => _filter = v)),
                const SizedBox(width: 8),
                _FilterChip(
                    label: '🟡 متابعة',
                    value: 'warning',
                    current: _filter,
                    onTap: (v) => setState(() => _filter = v)),
                const SizedBox(width: 8),
                _FilterChip(
                    label: '🔴 تدخل',
                    value: 'negative',
                    current: _filter,
                    onTap: (v) => setState(() => _filter = v)),
              ],
            ),
          ),
        ),
        // Company list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
            itemCount: _filtered.length,
            itemBuilder: (_, i) => CompanyCard(company: _filtered[i]),
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String value;
  final String current;
  final void Function(String) onTap;

  const _FilterChip({
    required this.label,
    required this.value,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = value == current;
    return GestureDetector(
      onTap: () => onTap(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: AppRadius.chip,
          border: Border.all(
            color: isActive ? AppColors.primary : const Color(0xFFCBD5E1),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : AppColors.textDark,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
