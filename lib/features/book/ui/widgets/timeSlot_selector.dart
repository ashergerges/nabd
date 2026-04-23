import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
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
    return Wrap(
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
              color: isSelected ? AppColors.primary : AppColors.backgroundColor,
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
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}