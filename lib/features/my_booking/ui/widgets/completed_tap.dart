import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/constants/pull_refresh.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/cubit/my_booking_cubit.dart';
import 'package:nawy/features/my_booking/data/models/booking_details_model.dart';
import 'package:nawy/features/my_booking/ui/widgets/my_booking_card.dart';
import 'package:nawy/features/my_booking/ui/widgets/review_widget.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/interfaces/i_local_preference.dart';
import '../../../../core/utils/common_widgets/empty_widget.dart' show EmptyWidget;
import '../../../../gen/assets.gen.dart';
import '../../../../main_common.dart';

class CompletedTap extends StatelessWidget {
  const CompletedTap({super.key, required this.booksCompleted});
  final List<BookingDetailsModel> booksCompleted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBookingCubit, MyBookingState>(
  builder: (context, state) {
    return SmartRefresher(
      controller: state.refreshControllerCompleted,
      enablePullDown: true,
      enablePullUp: true,
      physics: const BouncingScrollPhysics(),
      header: PullRefresh.pullRefresh,
      footer: PullRefresh.loadMoreRefresh,
      onRefresh: () => context.read<MyBookingCubit>().booksCompleted(
        isPull: true,
      ),
      onLoading: () => context.read<MyBookingCubit>().booksCompletedMore(),
      child: booksCompleted.isEmpty?EmptyWidget(
        text: LocaleKeys.noCompletedBookings.tr(),
        image:Assets.svg.error.svg() ,
      ):ListView.separated(
        physics:BouncingScrollPhysics(),
        itemCount: booksCompleted.length,
        padding: 16.padTop+16.padHorizontal,

        itemBuilder: (BuildContext c, int index) {
          return  MyBookingCard(
            onTap: (){
              if(!(getIt<ILocalPreference>().appUser.value?.isVendor??false)) {
                ViewBookingDetailsRoute(bookingId:booksCompleted[index].id??0 ).push(context);
              }
            },
            onTapRate: (){
              MessageService.showNewCustomDialog(
                context,
                child: ReviewWidget(
                  title: LocaleKeys.rateYourBookingExperience.tr(),
                  subTitle:LocaleKeys.yourFeedbackHelpsUsImprove.tr(),
                  onSubmit: (score, comment) {
                    context.read<MyBookingCubit>().sendRate(
                      bookId: booksCompleted[index].id??0,
                      score: score,
                      comment: comment,
                    );
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
            title: booksCompleted[index].product?.name??"",
            packageName:booksCompleted[index].package?.name??"",
            date: "${booksCompleted[index].date??""} - ${booksCompleted[index].time??""}",
            price: double.parse(booksCompleted[index].totalPrice??"0"),
            imageUrl: AppStrings.kTestNetworkImage,
          );
        },      separatorBuilder:(BuildContext c, int i) => 12.verticalSpace,
      ),
    );
  },
);
  }
}
