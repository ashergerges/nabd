import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/cubit/book_cubit.dart';
import 'package:nawy/features/book/ui/widgets/selectable_list_widget.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key, });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return Padding(
          // physics: BouncingScrollPhysics(),
          padding: 24.padHorizontal + 24.padTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.paymentMethod.tr(),
                  style: AppTextTheme.bodyLargeSemiBold(context)),
              12.verticalSpace,
              SelectableListWidget(
                initialSelected: state.bookRequest?.paymentMethod,
                items: state.paymentMethods,
                onSelected: (item) {
                 context.read<BookCubit>().setPaymentMethods(value: item.id??0);
                },
              ),
              12.verticalSpace,
              Spacer(),
              Container(
                padding: 16.padAll,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary100),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(LocaleKeys.total.tr(),
                      style: AppTextTheme.bodyLarge(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                    Text(
                      "${state.bookRequest?.totalPrice} رس",
                      style: AppTextTheme.bodyLargeMediumWeight(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
