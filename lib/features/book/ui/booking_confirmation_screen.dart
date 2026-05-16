import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/data/model/book_confirmation_model.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';
@RoutePage()
class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key,  this.bookConfirmation});
  final BookConfirmationModel? bookConfirmation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.confirmBooking.tr()),
      body: SizedBox(
        width: double.infinity, // Add this to make Column take full width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.svg.success.svg(
              height: 100.h,
              width: 100.h,
            ),
            12.verticalSpace,
            Text(
              LocaleKeys.bookingConfirmed.tr(),
              style: AppTextTheme.bodySmallMediumWeight(context),
            ),
            24.verticalSpace,
            Text(
              LocaleKeys.dreamVenueBookedSuccessfully.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            40.verticalSpace,
            Text(LocaleKeys.bookingNumber.tr(args: ['${bookConfirmation?.code}']),
              style: AppTextTheme.bodyLargeSemiBold(context),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: 16.padAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
                onTap: (){
                  context.navigateTo(ViewBookingDetailsRoute(bookingId: bookConfirmation?.id??0));
                },
                text:LocaleKeys.viewBookingDetails.tr()),
            12.verticalSpace,
            AppButton(
              background: AppColors.white,
                border: Border.all(color: AppColors.primary),
                textColor:  AppColors.primary,
                onTap: (){
                  context.router.replaceAll([
                    HomeBottomTabsRoute()
                  ], updateExistingRoutes: false);
                },
                text:LocaleKeys.backToHome.tr()),
          ],
        ),
      ),
    );
  }
}
