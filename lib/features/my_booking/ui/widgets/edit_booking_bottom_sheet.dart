import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/cubit/book_cubit.dart';
import 'package:nawy/features/book/ui/selected_date_step.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../../core/utils/app_time_format.dart';
import '../../../../core/utils/common_widgets/on_tap.dart';
import '../../../../core/utils/constants/app_text_them.dart';

/// Cancel booking bottom sheet
///
/// Shows a bottom sheet to collect cancellation reason
/// Performance: const constructors, extracted widgets
class EditBookingBottomSheet extends StatefulWidget {
  const EditBookingBottomSheet({
    super.key,
    required this.onEdit,
    required this.productId,
  });

  final int productId;
  final Function(String date, String time) onEdit;

  /// Show the bottom sheet
  static Future<void> show(
    BuildContext context, {
    required int productId,
    required Function(String date, String time) onEdit,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          EditBookingBottomSheet(onEdit: onEdit, productId: productId),
    );
  }

  @override
  State<EditBookingBottomSheet> createState() => _EditBookingBottomSheetState();
}

class _EditBookingBottomSheetState extends State<EditBookingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: BlocProvider(
          create: (context) => BookCubit()
            ..getTimeSlots(
              vendorId: widget.productId,
              date: AppTimeFormat.nowFormatted(),
            ),
          child: BlocBuilder<BookCubit, BookState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: SelectedDateStep(vendorId: widget.productId)),
                  24.verticalSpace,
                  Container(
                    padding: 16.padAll,
                    child: AppButton(
                        isDisable: (state.currentStep==0&&state.bookRequest?.time==null)||(state.currentStep==2&&state.paymentMethods.isEmpty),

                        isLoading: state.currState is Loading,
                        onTap: (){
                          widget.onEdit(state.bookRequest?.date??"",state.bookRequest?.time??"",);
                          Navigator.of(context).pop();

                        },
                        text:LocaleKeys.save.tr()),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
