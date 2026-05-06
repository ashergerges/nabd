import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/cubit/my_booking_cubit.dart';
import 'package:nawy/features/my_booking/ui/widgets/booking_details_shimmer.dart';

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
      appBar: CustomAppBar(title: "تفاصيل الحجز",),
      body: state.currState is Loading?BookingDetailsShimmer():SingleChildScrollView(
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
                    padding: 8.padVertical+12.padHorizontal,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.secondary100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.svg.checkmark.svg(height: 24.h),
                        8.horizontalSpace,
                        Text("تم تأكيد الحجز",style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.secondary),)
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  Text("تم الدفع بتاريخ: ١٢ فبراير ٢٠٢٦ - الساعة ٩:٤٢ صباحً",style: AppTextTheme.bodySmallMediumWeight(context),),
                  8.verticalSpace,
                  Text("رقم الحجز: #JN-12348",style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral400),),
                  8.verticalSpace,

                ],
              ),
            ),
            24.verticalSpace,
            Row(
              children: [
                Expanded(child: CustomNetworkImageCached(radius: 12,imageUrl: AppStrings.kTestNetworkImage,height: 120.h,)),
                16.horizontalSpace,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "باقة الزفاف الملكي",
                        style: AppTextTheme.bodyMediumSemiBold(context),
                      ),
                      8.verticalSpace,
                      Text(
                        "قاعة كريستال",
                        style: AppTextTheme.bodySmall(context),
                      ),
                      6.verticalSpace,
                      Text(
                        "يستوعب حتى 300 ضيف",
                        style: AppTextTheme.bodySmall(
                          context,
                        ).copyWith(color: AppColors.neutral400),
                      ),
                    ],
                  ),
                )
              ],
            ),
            12.verticalSpace,
            Divider(
              color: AppColors.primary100,
              height: 2,
            ),
            12.verticalSpace,
            Text("تفاصيل الفعالية",style: AppTextTheme.bodyLargeSemiBold(context),),
            16.verticalSpace,
            Row(
              children: [
                Assets.svg.dateTime.svg(height: 24.h),
                2.horizontalSpace,
                Text(
                  "الخميس، 20 فبراير 2026 - الساعة 9:00 صباحاً",
                  style: AppTextTheme.bodySmall(context)
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                Assets.svg.location.svg(height: 24.h),
                2.horizontalSpace,
                Text(
                  "الرياض، الملقا",
                  style: AppTextTheme.bodySmall(context).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.textColor,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                Assets.svg.phone.svg(height: 24.h),
                2.horizontalSpace,
                Text(
                  "اتصل بالمكان",
                  style: AppTextTheme.bodySmall(context).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.textColor,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Divider(
              color: AppColors.neutral50,
              height: 2,
            ),
            24.verticalSpace,
            Text("الخدمات المشمولة",style: AppTextTheme.bodyLargeSemiBold(context),),
            12.verticalSpace,
            Text("✓ خدمات الطعام",style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral400),),
            6.verticalSpace,
            Text("✓ دي جي",style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral400),),
            6.verticalSpace,
            Text("✓ ديكور",style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral400),),
            6.verticalSpace,
            Text("✓ التصوير الفوتوغرافي",style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral400),),
            12.verticalSpace,
            Divider(
              color: AppColors.neutral50,
              height: 2,
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Container(
        padding: 16.padAll,
        child: AppButton(
            background: AppColors.white,
            border: Border.all(color: AppColors.primary),
            textColor:  AppColors.primary,
            onTap: (){
              context.router.replaceAll([
                HomeBottomTabsRoute()
              ], updateExistingRoutes: false);
            },
            text:"العودة إلى الصفحة الرئيسية"),
      ),
    );
  },
),
);  }
}
