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
          Text("ملخص الحجز", style: AppTextTheme.bodyLargeSemiBold(context)),
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
                      "يستوعب حتى ${data.avgCount} ضيف",
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
          Text("تفاصيل السعر", style: AppTextTheme.bodyLargeSemiBold(context)),
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
                    Text("سعر الباقة", style: AppTextTheme.bodySmall(context)),
                    Text(
                      "${data.price} رس",
                      style: AppTextTheme.bodySmallMediumWeight(context),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "ضريبة القيمة المضافة (15%)",
                      style: AppTextTheme.bodySmall(context),
                    ),
                    Text(
                      "${(data.price * 0.15)} رس",
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
                      "الاجمالي",
                      style: AppTextTheme.bodySmall(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                    Text(
                      "${data.price + (data.price * 0.15)} رس",
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
