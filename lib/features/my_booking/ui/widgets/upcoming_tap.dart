import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/constants/pull_refresh.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/cubit/my_booking_cubit.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
import 'package:nawy/features/my_booking/ui/widgets/my_booking_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UpcomingTap extends StatelessWidget {
  const UpcomingTap({super.key, required this.booksUpcoming});
  final List<BookingDetailsModel> booksUpcoming;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBookingCubit, MyBookingState>(
  builder: (context, state) {
    return SmartRefresher(
      controller: state.refreshControllerUpcoming,
      enablePullDown: true,
      enablePullUp: true,
      physics: const BouncingScrollPhysics(),
      header: PullRefresh.pullRefresh,
      footer: PullRefresh.loadMoreRefresh,
      onRefresh: () => context.read<MyBookingCubit>().booksUpcoming(
        isPull: true,
      ),
      onLoading: () => context.read<MyBookingCubit>().booksUpcomingMore(),
      child: ListView.separated(
        physics:BouncingScrollPhysics(),
        itemCount: booksUpcoming.length,
        padding: 16.padTop+16.padHorizontal,
      
        itemBuilder: (BuildContext c, int index) {
          return  MyBookingCard(
            onTap: (){
              ViewBookingDetailsRoute(bookingId:booksUpcoming[index].id??0 ).push(context);
            },
            title: booksUpcoming[index].product?.name??"",
            packageName:booksUpcoming[index].package?.name??"",
            date: "${booksUpcoming[index].date??""} - ${booksUpcoming[index].time??""}",
            price: double.parse(booksUpcoming[index].totalPrice??"0"),
            imageUrl: AppStrings.kTestNetworkImage,
          );
        },
        separatorBuilder:(BuildContext c, int i) => 12.verticalSpace,
      ),
    );
  },
);
  }
}
