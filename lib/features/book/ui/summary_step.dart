import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/app_time_format.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/cubit/book_cubit.dart';
import 'package:nawy/features/book/data/model/book_screen_model.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class SummaryStep extends StatelessWidget {
  const SummaryStep({super.key, required this.data});

  final BookScreenModel data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: 24.padHorizontal + 24.padTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.bookingSummary.tr(), style: AppTextTheme.bodyLargeSemiBold(context)),
          12.verticalSpace,
          Container(
            padding: 16.padAll,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data.packageName,
                                style: AppTextTheme.bodyMediumSemiBold(context),
                              ),
                              4.verticalSpace,
                              Text(
                                data.productName,
                                style: AppTextTheme.bodySmall(context),
                              ),
                            ],
                          ),
                        ),
                        CustomNetworkImageCached(
                          height: 80.h,
                          width: 80.h,
                          imageUrl: data.image,
                          radius: 20,
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Text(
                      LocaleKeys.accommodatesUpToGuests.tr(args: ['${data.avgCount}'])                 ,
                      style: AppTextTheme.bodySmall(
                        context,
                      ).copyWith(color: AppColors.neutral400),
                    ),
                    12.verticalSpace,
                    Divider(color: AppColors.primary100),
                    12.verticalSpace,
                    Text(
                      AppTimeFormat.formatDateToArabic(state.bookRequest?.date),
                      style: AppTextTheme.bodySmallMediumWeight(context),
                    ),
                    8.verticalSpace,
                    Text(
                      AppTimeFormat.formatTime(state.bookRequest?.time),
                      style: AppTextTheme.bodySmallMediumWeight(context),
                    ),
                  ],
                );
              },
            ),
          ),
          24.verticalSpace,
          Text(
              LocaleKeys.priceDetails.tr(), style: AppTextTheme.bodyLargeSemiBold(context)),
          12.verticalSpace,
          Container(
            padding: 24.padAll,

            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border.all(color: AppColors.primary100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.packagePrice.tr(),
                      style: AppTextTheme.bodySmall(context),
                    ),
                    Text(
                      "${((data.price) / 1.15).toStringAsFixed(2)} ${LocaleKeys.riyal.tr()}",
                      style: AppTextTheme.bodySmallMediumWeight(context),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.vatFifteenPercent.tr(),
                      style: AppTextTheme.bodySmall(context),
                    ),
                    Text(
                      "${(((data.price) - ((data.price ?? 0) / 1.15))).toStringAsFixed(2)} ${LocaleKeys.riyal.tr()}",
                      style: AppTextTheme.bodySmallMediumWeight(context),
                    ),
                  ],
                ),
                12.verticalSpace,
                Divider(color: AppColors.primary100),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      LocaleKeys.grandTotal.tr(),
                      style: AppTextTheme.bodySmall(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                    Text(
                      "${data.price } ${LocaleKeys.riyal.tr()}",
                      style: AppTextTheme.bodySmallMediumWeight(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
