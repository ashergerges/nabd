import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/ui/widgets/package_card.dart';
import 'package:nawy/features/vendor_details/ui/widgets/service_price.dart';
import 'package:nawy/gen/locale_keys.g.dart';


// Sticky Tab Bar Delegate
class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.padVertical.add(16.padStart),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.services.tr(),style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w600),),
          18.verticalSpace,
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              physics:BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext c, int i) {
                return ServicePrice();
              },
              separatorBuilder:(BuildContext c, int i) => 12.horizontalSpace,
            ),
          ),
          24.verticalSpace,
          Text(LocaleKeys.packages.tr(),style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w600),),
          18.verticalSpace,
          Expanded(
            child: ListView.separated(
              physics:NeverScrollableScrollPhysics(),
              itemCount: 5,
              padding: 16.padEnd,
              itemBuilder: (BuildContext c, int i) {
                return  PackageCard(
                  onTap: (){
                    VendorPackageDetailsRoute(vendorPackageId: 0).push(context);

                  },
                  title: 'قاعة كريستال',
                  capacity: 500,
                  location: 'الرياض',
                  rating: 4.9,
                  price: 12000,
                  imageUrl:
                  AppStrings.kTestNetworkImage,
                  discountPercent: 30,
                  isFavorite: true,
                );
              },
              separatorBuilder:(BuildContext c, int i) => 12.verticalSpace,
            ),
          ),
         
        ],
      ),
    );
  }
}




