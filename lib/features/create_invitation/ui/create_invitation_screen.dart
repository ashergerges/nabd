import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/app_time_format.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/core/utils/helper/validator.dart';
import 'package:nawy/features/book/ui/widgets/date_picker_widget.dart';
import 'package:nawy/features/create_invitation/cubit/create_invitation_cubit.dart';
import 'package:nawy/features/create_invitation/ui/contact_picker_sheet.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../gen/assets.gen.dart';
@RoutePage()
class CreateInvitationScreen extends StatelessWidget {
  const CreateInvitationScreen({super.key, required this.bookingDetails});
  final BookingDetailsModel bookingDetails;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => CreateInvitationCubit(),
      child: BlocBuilder<CreateInvitationCubit, CreateInvitationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: LocaleKeys.createInvitations.tr()),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: 24.padHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.enterData.tr(),
                      style: AppTextTheme.bodyLarge(context)
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    24.verticalSpace,
                    Text(
                        LocaleKeys.weddingHallName.tr()
                        , style: AppTextTheme.bodyLarge(context)),
                    12.verticalSpace,
                    Container(
                      width: double.infinity,
                      padding: 24.padHorizontal + 8.padVertical,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary100),
                      ),
                      child: Text(
                        bookingDetails.product?.name ?? "",
                        style: AppTextTheme.bodyLargeSemiBold(context),
                      ),
                    ),
                    24.verticalSpace,
                    Text(
                        LocaleKeys.location.tr()
                        , style: AppTextTheme.bodyLarge(context)),
                    12.verticalSpace,
                    Container(
                      width: double.infinity,
                      padding: 24.padHorizontal + 8.padVertical,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary100),
                      ),
                      child: OnTap(
                        onTap: () {
                          UrlLauncher.openGoogleMapWithDic(
                            double.parse(bookingDetails.product?.lat ?? "0"),
                            double.parse(bookingDetails.product?.long ?? "0"),
                          );
                        },
                        child: Row(
                          children: [
                            Assets.svg.location.svg(height: 24.h),
                            8.horizontalSpace,
                            Text(
                              bookingDetails.product?.address ?? "",
                              style: AppTextTheme.bodyLargeSemiBold(context)
                                  .copyWith(
                                decorationColor: AppColors.textColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    Text(
                        LocaleKeys.brideName.tr(), style: AppTextTheme.bodyLarge(context)),
                    12.verticalSpace,
                    AppTextField(
                      label: "",
                      fillColor: AppColors.backgroundColor,
                      radius: 12.r,
                      onChange: context.read<CreateInvitationCubit>().setNameBride,
                      validator: Validator.validate,
                    ),
                    24.verticalSpace,
                    Text(
                        LocaleKeys.groomName.tr(), style: AppTextTheme.bodyLarge(context)),
                    12.verticalSpace,
                    AppTextField(
                      label: "",
                      fillColor: AppColors.backgroundColor,
                      radius: 12.r,
                      onChange: context.read<CreateInvitationCubit>().setNameGroom,
                      validator: Validator.validate,
                    ),
                    24.verticalSpace,
                    Text(
                        LocaleKeys.date.tr(), style: AppTextTheme.bodyLarge(context)),
                    12.verticalSpace,
                    DatePickerWidget(
                      viewOnly: true,
                      initialDate: AppTimeFormat.parseDateTime(
                        bookingDetails.date ?? DateTime.now().toString(),
                      ),
                    ),
                    12.verticalSpace,
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: 16.padAll,
              child: AppButton(
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    showContactPickerSheet(
                      context,
                      onConfirm: (list) {
                        log("Here this list is chosen::$list");
                      },
                    );
                  }
                },
                text: LocaleKeys.submit.tr(),
              ),
            ),
          );
        },
      ),
    );
  }
}
