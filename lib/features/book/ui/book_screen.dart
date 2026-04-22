import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/locale_keys.g.dart';
@RoutePage()
class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "اكمل الحجز",),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:37.padHorizontal,
            child: CustomStepper(
              currentStep: 0,
              stepTitles: ['موعدك', 'الملخص', 'الدفع'],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: 24.padHorizontal+24.padTop,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اختر التاريخ",style: AppTextTheme.bodyLargeSemiBold(context),),
                  12.verticalSpace,
                  DatePickerWidget(),
                  24.verticalSpace,
                  Text("الفترات الزمنية المتاحة",style: AppTextTheme.bodyLargeSemiBold(context),),
                  12.verticalSpace,
                  TimeSlotSelector(
                    onTimeSelected: (value){},
                    // initialSelectedTime: '12:00 ص',
                    timeSlots: [
                      '09:00 ص',
                      '09:05 ص',
                      '12:00 ص',
                      '09:00 م',

                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: 16.padAll,
        child: AppButton(text: "المتابعة"),
      ),    );
  }
}


class TimeSlotSelector extends StatefulWidget {
  final List<String> timeSlots;
  final Function(String) onTimeSelected;
  final String? initialSelectedTime;
  final List<String>? disabledTimeSlots;

  const TimeSlotSelector({
    Key? key,
    required this.timeSlots,
    required this.onTimeSelected,
    this.initialSelectedTime,
    this.disabledTimeSlots,
  }) : super(key: key);

  @override
  State<TimeSlotSelector> createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  String? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialSelectedTime;
  }

  bool _isTimeSlotDisabled(String timeSlot) {
    return widget.disabledTimeSlots?.contains(timeSlot) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return   Wrap(
      spacing: 12,
      runSpacing: 12,
      children: widget.timeSlots.map((timeSlot) {
        final isSelected = _selectedTime == timeSlot;
        final isDisabled = _isTimeSlotDisabled(timeSlot);

        return OnTap(
          onTap: isDisabled
              ? null
              : () {
            setState(() {
              _selectedTime = timeSlot;
            });
            widget.onTimeSelected(timeSlot);
          },
          child: Container(
            padding: 12.padAll,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : isDisabled
                    ? const Color(0xFFE0E0E0)
                    : AppColors.primary,
                width: 1.5,
              ),
            ),
            child: Text(
              timeSlot,
              style: AppTextTheme.bodyMedium(context).copyWith(
                color: isSelected
                    ? AppColors.white
                    : isDisabled
                    ? AppColors.neutral300
                    : AppColors.primary,
              )
            ),
          ),
        );
      }).toList(),
    );
  }
}

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
          children: List.generate(
            stepTitles.length * 2 - 1,
                (index) {
              if (index.isEven) {
                // Step circle
                int stepIndex = index ~/ 2;
                return _buildStep(stepIndex);
              } else {
                // Line between steps
                int stepIndex = index ~/ 2;
                return _buildLine(stepIndex);
              }
            },
          ),
        ),
        8.verticalSpace,
        // Step titles row
        Row(
          children: List.generate(
            stepTitles.length * 2 - 1,
                (index) {
              if (index.isEven) {
                // Step title
                int stepIndex = index ~/ 2;
                return _buildStepTitle(stepIndex,context);
              } else {
                // Empty space for line
                return const Expanded(child: SizedBox());
              }
            },
          ),
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activeColor,
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 16,
        ),
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
          border: Border.all(
            color: activeColor,
            width: 2,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeColor,
          ),
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
          border: Border.all(
            color: inactiveColor,
            width: 2,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: inactiveBorderInsideColor,
              width: 2,
            ),
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

  Widget _buildStepTitle(int stepIndex,context) {
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
        style:  AppTextTheme.bodyMedium(context).copyWith(
          color: isActive?AppColors.primary:null,
          fontWeight: isActive?FontWeight.w600:null
        )
      ),
    );
  }
}


class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  List<DateTime?> _selectedDates = [];

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.isEnglish; // Change based on your locale

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary100)
      ),
      padding: 16.padHorizontal,
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          selectedDayHighlightColor: AppColors.primary,
          weekdayLabels: isEnglish
              ? ['S', 'M', 'T', 'W', 'T', 'F', 'S']
              : ['ح', 'ن', 'ث', 'ر', 'خ', 'ج', 'س'],
          firstDayOfWeek: 0,
          controlsHeight: 50,
          lastMonthIcon: const Icon(
            Icons.chevron_left,
            color: AppColors.primary,
          ),
          nextMonthIcon: const Icon(
            Icons.chevron_right,
            color: AppColors.primary,
          ),
          controlsTextStyle: TextStyle(
            color:AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          dayTextStyle: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.normal,
          ),
          disabledDayTextStyle: TextStyle(
            color: AppColors.neutral100,
          ),
          todayTextStyle: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
          selectedDayTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),

          selectableDayPredicate: (day) {
            final today = DateTime.now();
            final todayDate = DateTime(today.year, today.month, today.day);
            return !day.isBefore(todayDate);
          },
        ),
        value: _selectedDates,
        onValueChanged: (dates) {
          setState(() {
            _selectedDates = dates;
          });
        },
      ),
    );
  }
}