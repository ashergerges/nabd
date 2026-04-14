import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Column();
  }
}

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

