import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

class HomeSlider extends StatefulWidget {
  final List<String> imageUrls;
  final bool autoPlay;
  final Duration autoPlayInterval;

  const HomeSlider({
    super.key,
    required this.imageUrls,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    if (!widget.autoPlay || widget.imageUrls.length <= 1) return;

    _timer = Timer.periodic(widget.autoPlayInterval, (_) {
      final nextIndex = (_currentIndex + 1) % widget.imageUrls.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          // ── Image PageView ──────────────────────────────────
          SizedBox(
            width: double.infinity,
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (context, index) {
                return CustomNetworkImageCached(
                  imageUrl: widget.imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
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
                  margin: 4.padHorizontal,
                  width: isActive ? 20 : 7,
                  height: 3,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.white : AppColors.primary100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSliderShimmer extends StatelessWidget {
  const HomeSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          /// Background shimmer (image area)
          ShimmerWidget.rectangular(
            width: double.infinity,
            height: 250,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),

          /// Optional dark overlay (to match real UI feel)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),

          /// Fake indicators
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: 4.padHorizontal,
                  child: ShimmerWidget.rectangular(
                    width: index == 0 ? 20 : 7,
                    height: 3,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}