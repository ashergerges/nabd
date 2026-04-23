import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
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
        border: Border.all(color: AppColors.primary100),
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
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          dayTextStyle: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.normal,
          ),
          disabledDayTextStyle: TextStyle(color: AppColors.neutral100),
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