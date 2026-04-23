import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/ui/widgets/date_picker_widget.dart';
import 'package:nawy/features/book/ui/widgets/timeSlot_selector.dart' show TimeSlotSelector;
class SelectedDateStep extends StatelessWidget {
  const SelectedDateStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: 24.padHorizontal + 24.padTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("اختر التاريخ", style: AppTextTheme.bodyLargeSemiBold(context)),
          12.verticalSpace,
          DatePickerWidget(),
          24.verticalSpace,
          Text(
            "الفترات الزمنية المتاحة",
            style: AppTextTheme.bodyLargeSemiBold(context),
          ),
          12.verticalSpace,
          TimeSlotSelector(
            onTimeSelected: (value) {},
            // initialSelectedTime: '12:00 ص',
            timeSlots: ['09:00 ص', '09:05 ص', '12:00 ص', '09:00 م'],
          ),
        ],
      ),
    );
  }
}
