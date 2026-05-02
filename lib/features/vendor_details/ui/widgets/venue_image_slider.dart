import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import '../../../../gen/assets.gen.dart';

class VenueImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  /// Called when the user taps the back arrow
  final VoidCallback? onBack;

  /// Called when the user taps share
  final VoidCallback? onShare;

  /// Controlled from outside if needed
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const VenueImageSlider({
    super.key,
    required this.imageUrls,
    this.onBack,
    this.onShare,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  State<VenueImageSlider> createState() => _VenueImageSliderState();
}

class _VenueImageSliderState extends State<VenueImageSlider> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // Curved bottom-left and bottom-right corners only
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Stack(
        children: [
          // ── Image PageView ──────────────────────────────────
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (context, index) {
                return Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFF2A2A2A),
                    child: const Icon(Icons.broken_image, color: Colors.white38, size: 48),
                  ),
                );
              },
            ),
          ),

          // ── Dot indicators ─────────────────────────────────
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imageUrls.length, (i) {
                final isActive = i == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 20 : 7,
                  height: 3,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Colors.white38,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),

          // ── Top bar overlay ─────────────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _VenueTopBar(
              isFavorite: widget.isFavorite,
              onBack: widget.onBack,
              onShare: widget.onShare,
              onFavoriteTap: widget.onFavoriteTap,
            ),
          ),
        ],
      ),
    );
  }
}


class _VenueTopBar extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onBack;
  final VoidCallback? onShare;
  final VoidCallback? onFavoriteTap;

  const _VenueTopBar({
    this.isFavorite = false,
    this.onBack,
    this.onShare,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: 16.padHorizontal+12.padVertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OnTap(
                onTap: onBack,
                child: _circleButton(Icon(Icons.arrow_back,color: AppColors.primary,size: 28.h,))),
            Row(
              children: [
                OnTap(
                    onTap: onShare,
                    child: _circleButton(Assets.svg.share.svg(height: 26.h,))),
                16.horizontalSpace,
                BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
                  builder: (context, state) {
                    return state.currState is Loading?ShimmerWidget.circular(height: 35,width: 35,): OnTap(
                      onTap: onFavoriteTap,
                      child: _circleButton(
                        (state.packageDetails?.isFavorite??false)?Assets.svg.favouriteCircle.svg(height: 28.h):Assets.svg.favouritePackage.svg(height: 28.h),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _circleButton(Widget child) {
    return Container(
        padding: 5.padAll,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: child
    );
  }

}


class VenueImageSliderShimmer extends StatelessWidget {
  const VenueImageSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Stack(
        children: [
          // 🔥 Full image shimmer
          ShimmerWidget.rectangular(
            width: double.infinity,
            height: double.infinity,
            shapeBorder: const RoundedRectangleBorder(),
          ),

          // 🔥 Dots indicator shimmer
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ShimmerWidget.rectangular(
                    width: index == 0 ? 20.w : 7.w,
                    height: 3.h,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),
          ),

          // 🔥 Top bar shimmer
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: 16.padHorizontal + 12.padVertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    ShimmerWidget.circular(
                      width: 40.w,
                      height: 40.w,
                    ),

                    Row(
                      children: [
                        // Share
                        ShimmerWidget.circular(
                          width: 40.w,
                          height: 40.w,
                        ),
                        16.horizontalSpace,

                        // Favorite
                        ShimmerWidget.circular(
                          width: 40.w,
                          height: 40.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}