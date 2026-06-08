import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: const Color(0xFFE2E8F0)),
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
          const SizedBox(height: 6),
          Text(
            label,
            style: AppTextStyles.label.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.heading.copyWith(
              fontSize: 16,
              color: valueColor ?? AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.success,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ),
    );
  }
}
