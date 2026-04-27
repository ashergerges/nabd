import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import 'package:nawy/features/vendor_details/ui/widgets/reviews_tap.dart';
import 'package:nawy/features/vendor_details/ui/widgets/bottom_navigation_bar.dart';
import 'package:nawy/features/vendor_details/ui/widgets/header_card.dart';
import 'package:nawy/features/vendor_details/ui/widgets/photos_tap.dart';
import 'package:nawy/features/vendor_details/ui/widgets/services_tap.dart';
import 'package:nawy/gen/locale_keys.g.dart';

@RoutePage()
class VendorDetailsScreen extends StatelessWidget {
  const VendorDetailsScreen({super.key, required this.vendorDetailsId});

  final int vendorDetailsId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VendorDetailsCubit()..vendorDetails(vendorDetailsId),
      child: Scaffold(
        body: Column(
          children: [
            CustomTopBar(),
            Expanded(child: VendorDetailsBody()),
          ],
        ),
        bottomNavigationBar: VendorBottomNavigationBar(),
      ),
    );
  }
}

class VendorDetailsBody extends StatefulWidget {
  const VendorDetailsBody({super.key});

  @override
  State<VendorDetailsBody> createState() => _VendorDetailsBodyState();
}

class _VendorDetailsBodyState extends State<VendorDetailsBody>
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
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(child: HeaderCard()),

          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyTabBarDelegate(
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
                  Tab(text: LocaleKeys.photos.tr(),),
                  Tab(text: LocaleKeys.servicesAndPackages.tr(),),
                  Tab(text: LocaleKeys.reviews.tr(),),


                ],
              ),
            ),
          ),
        ];
      },

      // Tab Views
      body: TabBarView(
        controller: _tabController,
        children: [ PhotosTab(), ServicesTab(), ReviewsTap(),],
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context,
      double shrinkOffset,
      bool overlapsContent,) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return false;
  }
}



