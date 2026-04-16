import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/ui/widgets/my_booking_card.dart';

class UpcomingTap extends StatelessWidget {
  const UpcomingTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics:BouncingScrollPhysics(),
      itemCount: 5,
      padding: 16.padTop+16.padHorizontal,

      itemBuilder: (BuildContext c, int i) {
        return  MyBookingCard(
          onTap: (){
            // VendorPackageDetailsRoute().push(context);

          },
          title: 'قاعة كريستال',
          packageName:"باقة الزفاف الملكي" ,
          date: "الخميس، 20 فبراير 2026 - 09:00 ص",
          price: 1700,
          imageUrl: AppStrings.kTestNetworkImage,
        );
      },
      separatorBuilder:(BuildContext c, int i) => 12.verticalSpace,
    );
  }
}
