import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as dir;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/ui/widgets/tip_card.dart';
import 'package:nawy/features/vendor_details/ui/widgets/vendor_package_details_bottom_navigation_bar.dart';
import 'package:nawy/features/vendor_details/ui/widgets/venue_image_slider.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../../../gen/assets.gen.dart';
@RoutePage()
class VendorPackageDetailsScreen extends StatelessWidget {
  const VendorPackageDetailsScreen({super.key});
  static const _images = [
    'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?w=800',
    'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?w=800',
    'https://images.unsplash.com/photo-1478146896981-b80fe463b330?w=800',
    'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?w=800',
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 380.h,
              child: VenueImageSlider(
                imageUrls: _images,

                onShare: () {},
                onBack: () => context.maybePop(),
              ),
            ),
            24.verticalSpace,
            Padding(
              padding:16.padHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("الباقة الملكية",style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w600),),
                  8.verticalSpace,
                  Row(
                    children: [
                      Assets.svg.location.svg(height: 24.h),
                      4.horizontalSpace,
                      Text(
                        "الرياض، الملقا",
                        style: AppTextTheme.bodySmall(context).copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  LastBookingPeople(),
                  24.verticalSpace,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:  [
                      TipCard(text: "300 ضيف"),
                      TipCard(text: "يجب الحجز قبل أسبوعين"),
                      TipCard(text: "بدون موسيقى"),
                      TipCard(text: "شامل الضيافة"),
                    ],
                  ),
                  24.verticalSpace,
                  Text("وصف",style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w600),),
                  8.verticalSpace,
                 Text("الضيافة: بوفيه مفتوح، مشروبات ترحيبية.\nالتجهيزات: مسرح فاخر، إضاءة سينمائية.\nمساحة خاصة: إمكانية الوصول إلى جناح العروس.",
                 style: AppTextTheme.bodyMedium(context),),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:VendorPackageDetailsBottomNavigationBar() ,
    );
  }
}





class LastBookingPeople extends StatelessWidget {
  LastBookingPeople({super.key});


  final List< String> users = [
     "https://i.pravatar.cc/150?img=12",
    "https://i.pravatar.cc/150?img=5",
    "https://i.pravatar.cc/150?img=8",
    "https://i.pravatar.cc/150?img=4",
    "https://i.pravatar.cc/150?img=39",
    "https://i.pravatar.cc/150?img=44",
  ];

  @override
  Widget build(BuildContext context) {
    final maxVisible = 4;
    final visibleUsers = users.take(maxVisible).toList();
    final remaining = users.length - visibleUsers.length;

    final isRTL = context.isEnglish;

    final stackWidth = (visibleUsers.length * 40);

    return Row(
      mainAxisSize: MainAxisSize.min,
      // textDirection: isRTL ? dir.TextDirection.rtl : dir.TextDirection.ltr,
      children: [
        SizedBox(
          width: stackWidth.toDouble(),
          height: 40,
          child: Stack(
            children: [
              ...visibleUsers.asMap().entries.map((entry) {
                int index = entry.key;
                var user = entry.value;

                return Positioned(
                  left: isRTL ? index * 30 : null,
                  right: isRTL ? null : index * 30,
                  child: AvatarImage(url: user),
                );
              }),

              if (remaining > 0)
                Positioned(
                  left: isRTL ? visibleUsers.length * 30 : null,
                  right: isRTL ? null : visibleUsers.length * 30,
                  child: RemainingAvatar(count: remaining),
                ),
            ],
          ),
        ),

        4.horizontalSpace,

        Text(
          "+$remaining ${LocaleKeys.book.tr()}",
          style: AppTextTheme.bodyXSmall(context)
              .copyWith(color: AppColors.primary),
        ),
      ],
    );
  }

}

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin:4.padStart,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3),
      ),
      child: CircleImage(
        imageUrl:url
      ),
    );
  }
}

class RemainingAvatar extends StatelessWidget {
  const RemainingAvatar({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
        border: Border.all(color: AppColors.white, width: 3),
      ),
      child: Text(
        "+",
        style:AppTextTheme.bodyLarge(context).copyWith(height: 0,fontWeight: FontWeight.w700,color: AppColors.white)
      ),
    );
  }
}