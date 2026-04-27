import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart'as dir;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Padding(
      padding: 16.padAll,
      child: Column(
        children: [
          TotalRateCard(),
          24.verticalSpace,
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