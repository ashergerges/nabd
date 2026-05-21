import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart'as dir;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import 'package:nawy/features/vendor_details/ui/widgets/review_card.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../../gen/assets.gen.dart';

class ReviewsTap extends StatelessWidget {
  const ReviewsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
  builder: (context, state) {

    final reviews = state.vendorDetails?.reviews;

    // 🔥 Loading
    if (reviews == null) {
      return const ReviewsTapShimmer();
    }
    return SingleChildScrollView(
      padding: 16.padAll,
      child: Column(
        children: [
          TotalRateCard(),
          24.verticalSpace,
        ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: state.vendorDetails?.reviews?.length??0,
          padding: 16.padTop + 16.padHorizontal,
          itemBuilder: (BuildContext c, int index) {
            return  ReviewCard(
              name: state.vendorDetails?.reviews?[index].userName??'',
              date: state.vendorDetails?.reviews?[index].createdAt??'',
              rating: state.vendorDetails?.reviews?[index].rating??0,
              comment: state.vendorDetails?.reviews?[index].comment??'',
              imageUrl:  state.vendorDetails?.reviews?[index].userImage
            );
          },
          separatorBuilder: (BuildContext c, int i) => 12.verticalSpace,
        )
         
        ],
      ),
    );
  },
);
  }
}
class ReviewsTapShimmer extends StatelessWidget {
  const ReviewsTapShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.padAll,
      child: Column(
        children: [
          const TotalRateCardShimmer(),
          24.verticalSpace,

          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (_, __) => const ReviewCardShimmer(),
              separatorBuilder: (_, __) => 12.verticalSpace,
            ),
          ),
        ],
      ),
    );
  }
}
class TotalRateCard extends StatelessWidget {
  const TotalRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
  builder: (context, state) {
    return Column(
      children: [
        Text("${state.vendorDetails?.avgRating??0}/5",style: AppTextTheme.headingMedium(context).copyWith(fontWeight: FontWeight.w700,color: AppColors.primary),),
        _StarRating(rating: 3.5,),
        Text(LocaleKeys.moreThan120Reviews.tr(args: [state.vendorDetails?.guestCount?.toString()??"0"]),style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.primary),),
      ],
    );
  },
);
  }
}
class TotalRateCardShimmer extends StatelessWidget {
  const TotalRateCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerWidget.rectangular(width: 60.w, height: 20.h),
        8.verticalSpace,
        ShimmerWidget.rectangular(width: 120.w, height: 16.h),
        8.verticalSpace,
        ShimmerWidget.rectangular(width: 140.w, height: 12.h),
      ],
    );
  }
}
class _StarRating extends StatelessWidget {
  final double rating;
  const _StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: dir.TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          final starType = _getStarType(index);
          return SvgPicture.asset(
            starType,
            width: 18,
            height: 18,
          );
        }),
      ),
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