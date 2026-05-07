import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/ui/widgets/my_booking_card.dart';

class LoadingMyBooking extends StatelessWidget {
  const LoadingMyBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics:BouncingScrollPhysics(),
      itemCount:5,
      padding: 16.padTop+16.padHorizontal,

      itemBuilder: (BuildContext c, int index) {
        return  MyBookingCardShimmer(
        );
      },
      separatorBuilder:(BuildContext c, int i) => 12.verticalSpace,
    );
  }
}
