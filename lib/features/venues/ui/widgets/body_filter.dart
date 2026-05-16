import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/app_time_format.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/features/book/ui/widgets/date_picker_widget.dart';
import 'package:nawy/features/venues/cubit/venues_cubit.dart';
import 'package:nawy/features/venues/ui/widgets/price_section.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class BodyFilter extends StatelessWidget {
  const BodyFilter({super.key, required this.categoryId});
 final int  categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VenuesCubit, VenuesState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.filter.tr(),
                style: AppTextTheme.headingSmall(context).copyWith(
                ),
              ),
              24.verticalSpace,
              PriceSection(
                coin:  LocaleKeys.riyal.tr(),
                minValue: state.filterDataTemp?.minPrice ?? 0,
                maxValue: state.filterDataTemp?.maxPrice ?? 5000,
                minLimit: 0,
                maxLimit: 5000,
                onChanged: (range) {
                  log("setRangeSuite::${range}");
                  context
                      .read<VenuesCubit>()
                      .setRangeSuite( range);
                },
              ),
              16.verticalSpace,
              const Divider(
                height: 0.5,
                color: AppColors.neutral800,
              ),

              16.verticalSpace,
              Text( LocaleKeys.selectDate.tr(),
                  style: AppTextTheme.bodyLarge(context)
                      .copyWith(color: AppColors.neutral50)),
              16.verticalSpace,
              DatePickerWidget(
                initialDate: AppTimeFormat.parseDateTime(
                  state.filterDataTemp?.date ?? DateTime.now().toString(),
                ),
                onDateChanged: (value){
                  context.read<VenuesCubit>().setDate( AppTimeFormat.nowFormatted(date: value), );
                },
              ),
              const Divider(
                height: 0.5,
                color: AppColors.neutral800,
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: LocaleKeys.save.tr(),
                      radius: 15.r,
                      background: AppColors.primary,
                      textColor: AppColors.white,
                      onTap: () {
                        context.read<VenuesCubit>().saveFilterSuite(categoryId);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: AppButton(
                      text:  LocaleKeys.reset.tr(),
                      radius: 15.r,
                      background: AppColors.error,
                      textColor: AppColors.white,
                      onTap: () {
                        context.read<VenuesCubit>().resetSuiteFilter(categoryId);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
