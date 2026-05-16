import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class PhotosTab extends StatelessWidget {
  const PhotosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
      builder: (context, state) {
        final gallery = state.vendorDetails?.gallery;

        if (gallery == null) {
          return const PhotosTabShimmer();
        }

        if (gallery.isEmpty) {
          return  Center(
            child: Text(LocaleKeys.noPhotosAvailable.tr()),
          );
        }

        return GridView.builder(
          padding: 16.padAll,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 160.h
            ,
          ),
          itemCount: state.vendorDetails?.gallery?.length??0,
          itemBuilder: (context, index) {
            return CustomNetworkImageCached(
              imageUrl:state.vendorDetails?.gallery?[index].image?? AppStrings.kTestNetworkImage, radius: 12,);
          },
        );
      },
    );
  }
}
class PhotosTabShimmer extends StatelessWidget {
  const PhotosTabShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: 16.padAll,
      itemCount: 9, // fake items
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 160.h,
      ),
      itemBuilder: (context, index) {
        return ShimmerWidget.rectangular(
          width: double.infinity,
          height: 160.h,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        );
      },
    );
  }
}