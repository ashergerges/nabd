import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/app_time_format.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/cubit/book_cubit.dart';
import 'package:nawy/features/book/ui/widgets/date_picker_widget.dart';
import 'package:nawy/features/book/ui/widgets/timeSlot_selector.dart'
    show TimeSlotSelector, TimeSlotSelectorShimmer;

import '../../../core/utils/common_widgets/empty_widget.dart';
import '../../../gen/assets.gen.dart';

class SelectedDateStep extends StatelessWidget {
  const SelectedDateStep({super.key, required this.vendorId});
  final int vendorId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: 24.padHorizontal + 24.padTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("اختر التاريخ",
                  style: AppTextTheme.bodyLargeSemiBold(context)),
              12.verticalSpace,
              DatePickerWidget(
                initialDate: AppTimeFormat.parseDateTime(state.bookRequest?.date??AppTimeFormat.nowFormatted()),
                onDateChanged: (date) {
                  context.read<BookCubit>().setDate(value: AppTimeFormat.nowFormatted(date: date), vendorId: vendorId);
                },
              ),
              24.verticalSpace,
              Text(
                "الفترات الزمنية المتاحة",
                style: AppTextTheme.bodyLargeSemiBold(context),
              ),
              12.verticalSpace,
              TimeSlotSelectorWidget(),
            ],
          ),
        );
      },
    );
  }
}
class TimeSlotSelectorWidget extends StatelessWidget {
  const TimeSlotSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        switch (state.currState) {
          case Loading():
            return TimeSlotSelectorShimmer();

          case Error():
            return Center(
              child: EmptyWidget(
                text: "حدث خطأ في تحميل الأوقات المتاحة",
                image: Assets.svg.error.svg(),
              ),
            );

          case Success():
            if (state.availableSlots.isEmpty) {
              return Center(
                child: EmptyWidget(
                  text: "لا توجد أوقات متاحة للحجز حالياً",
                  image: Assets.svg.error.svg(),
                ),
              );
            }
            return TimeSlotSelector(
              onTimeSelected: (value) {
                context.read<BookCubit>().setTime(value: value);
              },
              initialSelectedTime: state.bookRequest?.time,
              timeSlots: state.availableSlots,
            );

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}