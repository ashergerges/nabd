import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/profile/cubits/fav/fav_cubit.dart';
import 'package:nawy/features/vendor_details/ui/widgets/package_card.dart';

@RoutePage()
class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..getWishlistVendor(),
      child: Container()
    );
  }
}

class FAVBody extends StatefulWidget {
  const FAVBody({super.key});

  @override
  State<FAVBody> createState() => _FAVBodyState();
}

class _FAVBodyState extends State<FAVBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Listen to tab changes
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      _onTabChanged(_tabController.index);
    }
  }

  void _onTabChanged(int index) {
    if (index == 0) {
      context.read<FavCubit>().getWishlistVendor();
    } else if (index == 1) {
      context.read<FavCubit>().getWishlistPackage();
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            Tab(text: "مقدمو الخدمات"),
            Tab(text: "الباقات"),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              VendorsTap(),
              PackagesTap(),
            ],
          ),
        ),
      ],
    );
  }
}

class VendorsTap extends StatelessWidget {
  const VendorsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      padding: 16.padTop + 16.padHorizontal,

      itemBuilder: (BuildContext c, int i) {
        return PackageCard(
          onTap: () {
            VendorPackageDetailsRoute().push(context);
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
      separatorBuilder: (BuildContext c, int i) => 12.verticalSpace,
    );
  }
}
class PackagesTap extends StatelessWidget {
  const PackagesTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      padding: 16.padTop + 16.padHorizontal,

      itemBuilder: (BuildContext c, int i) {
        return PackageCard(
          onTap: () {
            VendorPackageDetailsRoute().push(context);
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
      separatorBuilder: (BuildContext c, int i) => 12.verticalSpace,
    );
  }
}
