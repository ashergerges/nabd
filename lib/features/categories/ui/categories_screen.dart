import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/categories/cubit/categories_cubit.dart';
import 'package:nawy/features/categories/data/models/service_category_model.dart';

import '../../../gen/assets.gen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => CategoriesCubit()..categories(),
      child: Scaffold(
        body: Column(
          children: [
            CustomTopBar(
              child: Padding(
                padding: 10.padBottom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Assets.svg.logoName.svg(height: 30.h),
                    Builder(
                        builder: (context) {
                          return OnTap(
                              onTap: (){
                                context.read<CategoriesCubit>().setShowedSearch(true);
                              },
                              child: Assets.svg.search.svg(height: 24.h));
                        }
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state.currState is Loading) {
                    return ServiceCategoryGridShimmer();
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(state.isShowSearch)...[
                        24.verticalSpace,
                        Padding(
                          padding:16.padHorizontal,
                          child: AppTextField(label: "ابحث",
                            onChange: (value){
                              context.read<CategoriesCubit>().setSearchTerm(value);
                            },
                            suffixItem: OnTap(
                                onTap: (){
                                  context.read<CategoriesCubit>().setShowedSearch(false);
                                  context.read<CategoriesCubit>().setSearchTerm(null);
                                },
                                child: Padding(
                                  padding: 12.padTop,
                                  child: Text("الغاء",style: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.neutral400),),
                                )),
                            imagePre: Assets.svg.search.path,radius: 12,),
                        ),
                      ],
                      
                      Expanded(
                        child: ServiceCategoryGridEnhanced(
                          categories: state.categoriesList
                              .map(
                                (e) => ServiceCategory(
                                  title: e.nameAr ?? "",
                                  imagePath: e.image ?? "",
                                  id: e.id ?? 0,
                                ),
                              )
                              .toList(),
                          onCategoryTap: (category) {
                            VenuesRoute(category: category).push(context);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCategoryGridEnhanced extends StatelessWidget {
  final List<ServiceCategory> categories;
  final int crossAxisCount;
  final double spacing;
  final Function(ServiceCategory)? onCategoryTap;

  const ServiceCategoryGridEnhanced({
    super.key,
    required this.categories,
    this.crossAxisCount = 2,
    this.spacing = 16.0,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: 16.padHorizontal + 24.padTop,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 0.8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return AnimatedServiceCard(
          category: categories[index],
          index: index,
          onTap: () => onCategoryTap?.call(categories[index]),
        );
      },
    );
  }
}

class ServiceCategoryGridShimmer extends StatelessWidget {
  final int crossAxisCount;
  final double spacing;
  final int itemCount;

  const ServiceCategoryGridShimmer({
    super.key,
    this.crossAxisCount = 2,
    this.spacing = 16.0,
    this.itemCount = 6, // fixed during loading
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: 16.padHorizontal + 24.padTop,
      physics: const NeverScrollableScrollPhysics(),
      // important for skeleton
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 0.85,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const AnimatedServiceCardShimmer();
      },
    );
  }
}

class AnimatedServiceCard extends StatefulWidget {
  final ServiceCategory category;
  final int index;
  final VoidCallback? onTap;

  const AnimatedServiceCard({
    super.key,
    required this.category,
    required this.index,
    this.onTap,
  });

  @override
  State<AnimatedServiceCard> createState() => _AnimatedServiceCardState();
}

class _AnimatedServiceCardState extends State<AnimatedServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _slideAnimation = Tween<double>(
      begin: 30,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Stagger animations based on index
    Future.delayed(Duration(milliseconds: widget.index * 80), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: OnTap(
                onTap: widget.onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary100.withOpacity(0.04),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image container with fade-in
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: 16.padAll,

                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CustomNetworkImageCached(
                            imageUrl: widget.category.imagePath,
                          ),
                        ),
                      ),
                      12.verticalSpace,
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.category.title,
                          style: AppTextTheme.bodyLargeSemiBold(
                            context,
                          ).copyWith(color: AppColors.primary),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedServiceCardShimmer extends StatelessWidget {
  const AnimatedServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary100.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Image placeholder
          Expanded(
            flex: 7,
            child: Container(
              padding: 16.padAll,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ShimmerWidget.rectangular(
                width: double.infinity,
                height: double.infinity,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          12.verticalSpace,

          /// Title placeholder
          Expanded(
            flex: 1,
            child: ShimmerWidget.rectangular(width: 60, height: 12),
          ),
        ],
      ),
    );
  }
}
