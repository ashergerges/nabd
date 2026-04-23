import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
class CustomStepper extends StatelessWidget {
  final int currentStep;
  final List<String> stepTitles;
  final Color activeColor;
  final Color inactiveColor;
  final Color inactiveBorderInsideColor;
  final TextStyle? activeTextStyle;
  final TextStyle? inactiveTextStyle;

  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.stepTitles,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.primary400,
    this.inactiveBorderInsideColor = AppColors.warning50,
    this.activeTextStyle,
    this.inactiveTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Steps and lines row
        Row(
          children: List.generate(stepTitles.length * 2 - 1, (index) {
            if (index.isEven) {
              // Step circle
              int stepIndex = index ~/ 2;
              return _buildStep(stepIndex);
            } else {
              // Line between steps
              int stepIndex = index ~/ 2;
              return _buildLine(stepIndex);
            }
          }),
        ),
        8.verticalSpace,
        // Step titles row
        Row(
          children: List.generate(stepTitles.length * 2 - 1, (index) {
            if (index.isEven) {
              // Step title
              int stepIndex = index ~/ 2;
              return _buildStepTitle(stepIndex, context);
            } else {
              // Empty space for line
              return const Expanded(child: SizedBox());
            }
          }),
        ),
      ],
    );
  }

  Widget _buildStep(int stepIndex) {
    bool isCompleted = stepIndex < currentStep;
    bool isCurrent = stepIndex == currentStep;

    if (isCompleted) {
      // Completed step: filled circle with checkmark
      return Container(
        width: 30,
        height: 30,
        margin: 5.padAll,
        decoration: BoxDecoration(shape: BoxShape.circle, color: activeColor),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      );
    } else if (isCurrent) {
      // Current step: double border with padding
      return Container(
        width: 30,
        height: 30,
        padding: 5.padAll,
        margin: 5.padAll,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: activeColor, width: 2),
        ),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: activeColor),
        ),
      );
    } else {
      return Container(
        width: 30,
        height: 30,
        padding: 5.padAll,
        margin: 5.padAll,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: inactiveColor, width: 2),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: inactiveBorderInsideColor, width: 2),
          ),
        ),
      );
    }
  }

  Widget _buildLine(int stepIndex) {
    // Line is active if the step before it is completed
    bool isActive = stepIndex < currentStep;

    return Expanded(
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }

  Widget _buildStepTitle(int stepIndex, context) {
    bool isActive = stepIndex < currentStep;

    // Determine text alignment based on position
    TextAlign alignment;
    if (stepIndex == 0) {
      // First step - align left
      alignment = TextAlign.right;
    } else if (stepIndex == stepTitles.length - 1) {
      // Last step - align right
      alignment = TextAlign.left;
    } else {
      // Middle steps - align center
      alignment = TextAlign.center;
    }

    return Expanded(
      child: Text(
        stepTitles[stepIndex],
        textAlign: alignment,
        style: AppTextTheme.bodyMedium(context).copyWith(
          color: isActive ? AppColors.primary : null,
          fontWeight: isActive ? FontWeight.w600 : null,
        ),
      ),
    );
  }
}
