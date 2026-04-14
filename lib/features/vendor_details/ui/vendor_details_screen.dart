import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/ui/widgets/bottom_navigation_bar.dart';
import 'package:nawy/features/vendor_details/ui/widgets/header_card.dart';
import 'package:nawy/features/vendor_details/ui/widgets/photos_tap.dart';
import 'package:nawy/gen/assets.gen.dart';

@RoutePage()
class VendorDetailsScreen extends StatelessWidget {
  const VendorDetailsScreen({super.key, required this.vendorDetailsId});

  final int vendorDetailsId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(),
          Expanded(child: VendorDetailsBody()),
        ],
      ),
      bottomNavigationBar:VendorBottomNavigationBar() ,
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
                  labelStyle: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.primary,fontWeight: FontWeight.w700),
                  unselectedLabelStyle: AppTextTheme.bodyMedium(context),
                  indicatorColor:  AppColors.primary,
                  indicatorWeight: 3,
                  dividerColor: AppColors.primary100,
                  labelPadding: 0.padHorizontal,

                  tabs: const [
                    Tab(text: 'الصور',),

                    Tab(text: 'الخدمات والباقات'),
                    Tab(text: 'التطبيقات'),

                  ],
                ),
            ),
          ),
        ];
      },

      // Tab Views
      body: TabBarView(
        controller: _tabController,
        children: [ PhotosTab(),ServicesTab() ,ApplicationsTab(),],
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  final TabController controller;
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.controller.index;
    widget.controller.addListener(() {
      if (mounted) setState(() => _selectedIndex = widget.controller.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(widget.tabs.length, (index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => widget.controller.animateTo(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? const Color(0xFF312E81)
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  widget.tabs[index],
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF312E81)
                        : const Color(0xFF94A3B8),
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }),
        ),
        const Divider(height: 1, thickness: 1, color: Color(0xFFE2E8F0)),
      ],
    );
  }
}
// Sticky Tab Bar Delegate
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return false;
  }
}


class ApplicationsTab extends StatelessWidget {
  const ApplicationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.padAll,
      child: Column(
        children: [
          ReviewCard(
            name: 'سارة',
            date: '20 مارس 2024',
              rating: 3.5,
            comment: 'قاعة رائعة وفريق عمل محترف للغاية. كان البوفيه مذهلاً!',
            imageUrl: AppStrings.kTestNetworkImage, // or null for placeholder
          ),
        ],
      ),
    );
  }
}

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String comment;
  final String date;
  final double rating;
  final String? imageUrl;

  const ReviewCard({
    super.key,
    required this.name,
    required this.comment,
    required this.date,
    required this.rating,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 25.padAll,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.circleBackgroundColor,
                          blurRadius: 4,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CircleImage(
                      imageUrl: AppStrings.kTestNetworkImage,
                      size: 56.h,
                    ),
                  ),
                  8.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTextTheme.bodyMediumMediumWeight(
                          context,
                        ).copyWith(fontWeight: FontWeight.w700),
                      ),
                    8.verticalSpace,
                      _StarRating(rating: rating),
                    ],
                  ),



                ],
              ),
              Text(
                date,
                style: AppTextTheme.bodyXSmall(context)
              ),

            ],
          ),
         12.verticalSpace,
          Text(
            comment,
            textAlign: TextAlign.right,
            style: AppTextTheme.bodySmall(context)
          ),
        ],
      ),
    );
  }
}
class _StarRating extends StatelessWidget {
  final double rating;
  const _StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starType = _getStarType(index);
        return SvgPicture.asset(
          starType,
          width: 18,
          height: 18,
        );
      }),
    );
  }

  String _getStarType(int index) {
    if (index < rating.floor()) {
      return Assets.svg.favouriteRate.path;
    } else if (index < rating) {
      return Assets.svg.starHalf.path;
    } else {
      return Assets.svg.starEmpty.path;
    }
  }
}