import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/cubit/my_booking_cubit.dart';
import 'package:nawy/features/my_booking/ui/widgets/cancelled_tap.dart';
import 'package:nawy/features/my_booking/ui/widgets/completed_tap.dart';
import 'package:nawy/features/my_booking/ui/widgets/loading_my_booking.dart';
import 'package:nawy/features/my_booking/ui/widgets/upcoming_tap.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import '../../../gen/assets.gen.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MyBookingCubit()..booksUpcoming(),
        child: Column(
          children: [
            CustomTopBar(child: Padding(
              padding: 10.padBottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.svg.logoName.svg(height: 30.h),
                  Builder(
                      builder: (context) {
                        return OnTap(
                            onTap: (){
                              context.read<MyBookingCubit>().setShowedSearch(true);
                            },
                            child: Assets.svg.search.svg(height: 24.h));
                      }
                  ),
                ],
              ),
            ),),
            Expanded(child: MyBookingBody()),
          ],
        ),
      ),
    );
  }
}

class MyBookingBody extends StatefulWidget {
  const MyBookingBody({super.key});

  @override
  State<MyBookingBody> createState() => _MyBookingBodyState();
}
class _MyBookingBodyState extends State<MyBookingBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen to tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _onTabChanged(_tabController.index);
      }
    });
  }

  void _onTabChanged(int index) {
    final cubit = context.read<MyBookingCubit>();

    switch (index) {
      case 0:
      // Upcoming tab
        if (cubit.state.booksUpcoming.isEmpty) {
          cubit.booksUpcoming();
        }
        break;
      case 1:
      // Completed tab
        if (cubit.state.booksCompleted.isEmpty) {
          cubit.booksCompleted();
        }
        break;
      case 2:
      // Cancelled tab
        if (cubit.state.booksCancelled.isEmpty) {
          cubit.booksCancelled();
        }
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBookingCubit, MyBookingState>(
      builder: (context, state) {
        return Column(
          children: [
            if(state.isShowSearch)...[
              24.verticalSpace,
              Padding(
                padding:16.padHorizontal,
                child: AppTextField(label:LocaleKeys.search.tr(),
                  onChange: (value){
                    context.read<MyBookingCubit>().setSearchTerm(value);
                  },
                  suffixItem: OnTap(
                      onTap: (){
                        context.read<MyBookingCubit>().setShowedSearch(false);
                        context.read<MyBookingCubit>().setSearchTerm(null);
                      },
                      child: Padding(
                        padding: 12.padTop,
                        child: Text(LocaleKeys.cancel.tr(),style: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.neutral400),),
                      )),
                  imagePre: Assets.svg.search.path,radius: 12,),
              ),
            ],
            8.verticalSpace,
            TabBar(
              controller: _tabController,
              labelStyle: AppTextTheme.bodyMedium(context).copyWith(
                  color: AppColors.primary, fontWeight: FontWeight.w700),
              unselectedLabelStyle: AppTextTheme.bodyMedium(context),
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              dividerColor: AppColors.primary100,
              labelPadding: 0.padHorizontal,
              tabs: [
                Tab(text: LocaleKeys.upcoming.tr()),
                Tab(text: LocaleKeys.completed.tr()),
                Tab(text: LocaleKeys.cancelled.tr()),
              ],
            ),
            Expanded(
              child: state.currState is Loading?LoadingMyBooking():TabBarView(
                controller: _tabController,
                children: [
                  UpcomingTap(booksUpcoming: state.booksUpcoming),
                  CompletedTap(booksCompleted: state.booksCompleted),
                  CancelledTap(booksCancelled: state.booksCancelled),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
