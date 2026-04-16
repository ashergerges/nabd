import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/my_booking/ui/widgets/cancelled_tap.dart';
import 'package:nawy/features/my_booking/ui/widgets/completed_tap.dart';
import 'package:nawy/features/my_booking/ui/widgets/upcoming_tap.dart';
import '../../../gen/assets.gen.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          CustomTopBar(child: Padding(
            padding: 10.padBottom,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.svg.logoName.svg(height: 30.h),
                Assets.svg.search.svg(height: 24.h)
              ],
            ),
          ),),
          Expanded(child: MyBookingBody()),
        ],
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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelStyle: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.primary,fontWeight: FontWeight.w700),
          unselectedLabelStyle: AppTextTheme.bodyMedium(context),
          indicatorColor:  AppColors.primary,
          indicatorWeight: 3,
          dividerColor: AppColors.primary100,
          labelPadding: 0.padHorizontal,
          tabs:  [
            Tab(text:"قريباً",),
            Tab(text:"مكتمل",),
            Tab(text: "تم الإلغاء",),


          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [ UpcomingTap(),CompletedTap(), CancelledTap(),],
          ),
        ),
      ],

    );
  }
}
