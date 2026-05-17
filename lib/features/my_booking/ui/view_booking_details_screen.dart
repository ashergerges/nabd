import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/cubit/my_booking_cubit.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
import 'package:nawy/features/my_booking/ui/widgets/booking_details_shimmer.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../core/router/app_router.dart';
import '../../../gen/assets.gen.dart';

@RoutePage()
class ViewBookingDetailsScreen extends StatelessWidget {
  const ViewBookingDetailsScreen({super.key, required this.bookingId});

  final int bookingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBookingCubit()..bookDetails(bookId: bookingId),
      child: BlocBuilder<MyBookingCubit, MyBookingState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: LocaleKeys.bookingDetails.tr()),
            body: state.currState is Loading
                ? BookingDetailsShimmer()
                : SingleChildScrollView(
                    padding: 16.padHorizontal,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: 16.padAll,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: 8.padVertical + 12.padHorizontal,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.secondary100,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Assets.svg.checkmark.svg(height: 24.h),
                                    8.horizontalSpace,
                                    Text(
                                      LocaleKeys.bookingConfirmed.tr(),
                                      style: AppTextTheme.bodySmall(
                                        context,
                                      ).copyWith(color: AppColors.secondary),
                                    ),
                                  ],
                                ),
                              ),
                              16.verticalSpace,
                              Text(
                                LocaleKeys.paidOnDate.tr(args: ['${state.bookDetails?.paidOn}']),
                                style: AppTextTheme.bodySmallMediumWeight(
                                  context,
                                ),
                              ),
                              8.verticalSpace,
                              Text(
                                LocaleKeys.bookingNumber.tr(args: ['${state.bookDetails?.code}']),
                                style: AppTextTheme.bodySmall(
                                  context,
                                ).copyWith(color: AppColors.neutral400),
                              ),
                              8.verticalSpace,
                            ],
                          ),
                        ),
                        24.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomNetworkImageCached(
                                radius: 12,
                                imageUrl:
                                    state.bookDetails?.package?.image ??
                                    AppStrings.kTestNetworkImage,
                                height: 120.h,
                              ),
                            ),
                            16.horizontalSpace,
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.bookDetails?.package?.name ?? "",
                                    style: AppTextTheme.bodyMediumSemiBold(
                                      context,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  Text(
                                    state.bookDetails?.product?.name ?? "",
                                    style: AppTextTheme.bodySmall(context),
                                  ),
                                  6.verticalSpace,
                                  Text(
                                    LocaleKeys.accommodatesUpToGuests.tr(args: ['${state.bookDetails?.product?.guestCount}']),
                                    style: AppTextTheme.bodySmall(
                                      context,
                                    ).copyWith(color: AppColors.neutral400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        12.verticalSpace,
                        Divider(color: AppColors.primary100, height: 2),
                        12.verticalSpace,
                        Text(
                          LocaleKeys.eventDetails.tr(),
                          style: AppTextTheme.bodyLargeSemiBold(context),
                        ),
                        16.verticalSpace,
                        Row(
                          children: [
                            Assets.svg.dateTime.svg(height: 24.h),
                            2.horizontalSpace,
                            Text(
                              "${state.bookDetails?.date} - ${state.bookDetails?.time}",
                              style: AppTextTheme.bodySmall(context),
                            ),
                          ],
                        ),
                        8.verticalSpace,
                        OnTap(
                          onTap: () {
                            UrlLauncher.openGoogleMapWithDic(
                              double.parse(
                                state.bookDetails?.product?.lat ?? "0",
                              ),
                              double.parse(
                                state.bookDetails?.product?.long ?? "0",
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Assets.svg.location.svg(height: 24.h),
                              2.horizontalSpace,
                              Text(
                                state.bookDetails?.product?.address ?? "",
                                style: AppTextTheme.bodySmall(context).copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        8.verticalSpace,
                        OnTap(
                          onTap: () {
                            UrlLauncher.makePhoneCall(
                              state.bookDetails?.product?.phone ?? "",
                            );
                          },
                          child: Row(
                            children: [
                              Assets.svg.phone.svg(height: 24.h),
                              2.horizontalSpace,
                              Text(
                                LocaleKeys.contactVenue.tr(),
                                style: AppTextTheme.bodySmall(context).copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        12.verticalSpace,
                        Divider(color: AppColors.neutral50, height: 2),
                        24.verticalSpace,
                        Text(
                          LocaleKeys.includedServices.tr(),
                          style: AppTextTheme.bodyLargeSemiBold(context),
                        ),
                        12.verticalSpace,
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              state.bookDetails?.package?.services?.length ?? 0,
                          itemBuilder: (BuildContext c, int index) {
                            return Text(
                              "✓ ${state.bookDetails?.package?.services?[index].name}",
                              style: AppTextTheme.bodySmall(
                                context,
                              ).copyWith(color: AppColors.neutral400),
                            );
                          },
                          separatorBuilder: (BuildContext c, int i) =>
                              6.verticalSpace,
                        ),
                        12.verticalSpace,
                        Divider(color: AppColors.neutral50, height: 2),
                      ],
                    ),
                  ),
            bottomNavigationBar: BlocBuilder<MyBookingCubit, MyBookingState>(
              builder: (context, state) {
                final bookingDetails =
                    state.bookDetails ?? BookingDetailsModel();

                final bool isApproved = bookingDetails.status == 2;
                final bool hasInvitation =
                    bookingDetails.hasInvitation ?? false;

                return Container(
                  padding: 16.padAll,
                  child: AppButton(
                    isLoading: state.currState is Loading,
                    loadingColor: AppColors.primary,
                    background: AppColors.white,
                    border: Border.all(color: AppColors.primary),
                    textColor: AppColors.primary,
                    onTap: () async {
                      if (isApproved) {
                        if (hasInvitation) {
                          await InvitationTrackingRoute(bookingId:bookingDetails.id ).push(context);
                        } else {
                          await CreateInvitationRoute(
                            bookingDetails: bookingDetails,
                          ).push(context);
                        }

                        if (context.mounted) {
                          context
                              .read<MyBookingCubit>()
                              .bookDetails(bookId: bookingId);
                        }

                        return;
                      }

                      context.router.replaceAll(
                        [HomeBottomTabsRoute()],
                        updateExistingRoutes: false,
                      );
                    },
                    text: isApproved
                        ? hasInvitation
                        ? LocaleKeys.inviteMore.tr()
                        : LocaleKeys.guestInvitation.tr()
                        : LocaleKeys.backToHome.tr(),
                  ),
                );
              },
            ),          );
        },
      ),
    );
  }
}
