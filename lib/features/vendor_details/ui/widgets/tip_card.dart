import 'package:flutter/material.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';


class TipCard extends StatelessWidget {
  final String text;

  const TipCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.padVertical+16.padHorizontal,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: AppColors.primary100
        ),
      ),
      child: Text(
          text,
          style: AppTextTheme.bodySmall(context)
      ),
    );
  }
}
