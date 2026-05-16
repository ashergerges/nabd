import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/constants/pull_refresh.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/profile/cubits/fav/fav_cubit.dart';
import 'package:nawy/features/profile/data/models/fav/fav_package_model.dart';
import 'package:nawy/features/profile/data/models/fav/fav_vendor_model.dart';
import 'package:nawy/features/vendor_details/ui/widgets/package_card.dart';
import 'package:nawy/features/vendor_details/ui/widgets/vendor_card.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/utils/common_widgets/empty_widget.dart';
import '../../../gen/assets.gen.dart';

@RoutePage()
class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return FavCubit()
          ..getWishlistVendor();
      },
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.favorites.tr()),
        body: FAVBody(),
      ),
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
    print('🟢 initState called');
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    print('🟡 Tab change detected - indexIsChanging: ${_tabController
        .indexIsChanging}, current index: ${_tabController.index}');
    if (!_tabController.indexIsChanging) {
      _onTabChanged(_tabController.index);
    }
  }

  void _onTabChanged(int index) {
    print('🟠 _onTabChanged called with index: $index');
    if (index == 0) {
      print('📞 Calling getWishlistVendor');
      context.read<FavCubit>().getWishlistVendor();
    } else if (index == 1) {
      print('📞 Calling getWishlistPackage');
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
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
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
                Tab(text: LocaleKeys.serviceProviders.tr()),
                Tab(text: LocaleKeys.packages.tr()),
              ],
            ),
            Expanded(
              child:state.currState is Loading?LoadingFav(): TabBarView(
                controller: _tabController,
                children: [
                  VendorsTap(favVendors:state.favVendors,),
                  PackagesTap(favPackages: state.favPackages,),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class LoadingFav extends StatelessWidget {
  const LoadingFav({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      padding: 16.padTop + 16.padHorizontal,

      itemBuilder: (BuildContext c, int i) {
        return PackageCardShimmer();
      },
      separatorBuilder: (BuildContext c, int i) => 12.verticalSpace,
    );
  }
}
class VendorsTap extends StatelessWidget {
  const VendorsTap({super.key, required this.favVendors,});
  final List<FavVendorModel> favVendors;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
  builder: (context, state) {
    return SmartRefresher(
      controller:state.refreshVendorController ,
      onRefresh: () {
        context.read<FavCubit>().getWishlistVendor(isRefresh: true);
        state.refreshVendorController.refreshCompleted();
      },
      header: PullRefresh.pullRefresh,

      child:favVendors.isEmpty?EmptyWidget(
        text:LocaleKeys.noFavoritesInServiceProviders.tr(),
        image:Assets.svg.error.svg() ,
      ): ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: favVendors.length,
        padding: 16.padTop + 16.padHorizontal,

        itemBuilder: (BuildContext c, int index) {
          return VendorCard(
            onTap: () {
              VendorDetailsRoute(vendorDetailsId: favVendors[index].id??0).push(context).then((value){
                context.read<FavCubit>().getWishlistVendor(isRefresh: true);

              });
            },
            title: favVendors[index].name??"",
            dec:favVendors[index].description??"" ,
            price: double.parse(favVendors[index].priceAfter??"0"),
            imageUrl:favVendors[index].image??
            AppStrings.kTestNetworkImage,
            discountPercent: double.parse(favVendors[index].discount??"0"),
            isFavorite: true,
          );
        },
        separatorBuilder: (BuildContext c, int i) => 12.verticalSpace,
      ),
    );
  },
);
  }
}

class PackagesTap extends StatelessWidget {
  const PackagesTap({super.key, required this.favPackages});
  final List<FavPackageModel> favPackages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
  builder: (context, state) {
    return SmartRefresher(
      controller:state.refreshPackageController ,
      onRefresh: () {
        context.read<FavCubit>().getWishlistPackage(isRefresh: true);
        state.refreshPackageController.refreshCompleted();
      },
      header: PullRefresh.pullRefresh,
      child:favPackages.isEmpty?EmptyWidget(
        text:LocaleKeys.noFavoritesInPackages.tr(),
        image:Assets.svg.error.svg() ,
      ): ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: favPackages.length,
        padding: 16.padTop + 16.padHorizontal,
      
        itemBuilder: (BuildContext c, int index) {
          return PackageCard(
            onTap: () {
              VendorPackageDetailsRoute(vendorPackageId: favPackages[index].id??0).push(context).then((value){
                context.read<FavCubit>().getWishlistPackage(isRefresh: true);

              });
            },
            title: favPackages[index].title??"",
            capacity: favPackages[index].guestCount??0,
            location: favPackages[index].address??"",
            rating: favPackages[index].avgRate??0,
            price:double.parse( favPackages[index].priceAfter??"0"),
            imageUrl: favPackages[index].vendorImage??
            AppStrings.kTestNetworkImage,
            discountPercent:double.parse(  favPackages[index].discount??"0"),
            isFavorite: true,
          );
        },
        separatorBuilder: (BuildContext c, int i) => 12.verticalSpace,
      ),
    );
  },
);
  }
}
