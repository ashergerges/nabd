import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/home/ui/widgets/home_filter.dart';
import 'package:nawy/features/home/ui/widgets/home_slider.dart';
import 'package:nawy/features/home/ui/widgets/location_selector.dart';
import 'package:nawy/features/home/ui/widgets/offer_card.dart';
import 'package:nawy/features/home/ui/widgets/vendors_card.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/size_manager.dart';
import '../../../gen/assets.gen.dart';
import '../data/models/filter_chip_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const _images = [
    'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?w=800',
    'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?w=800',
    'https://images.unsplash.com/photo-1478146896981-b80fe463b330?w=800',
    'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?w=800',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBar(
          child: Padding(
            padding: 10.padBottom,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.svg.logoName.svg(height: 30.h),
                Assets.svg.search.svg(height: 24.h),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: 16.padHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                HomeSlider(imageUrls: _images,),
                24.verticalSpace,
                FilterChipBar(
                  items: const [
                    FilterChipModel(id: 1, name: 'قاعة الزفاف'),
                    FilterChipModel(id: 2, name: 'ماكياج'),
                    FilterChipModel(id: 3, name: 'صورة'),
                  ],
                  onSelected: (id) {
                    // id == 0 → "All" was tapped
                    print('Selected id: $id');
                  },
                ),

                24.verticalSpace,
                Text("الأعلى تقييمًا",style: AppTextTheme.bodyLargeSemiBold(context),),
                16.verticalSpace,
                SizedBox(
                  height: 140.h,
                  child: ListView.separated(
                    physics:BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext c, int i) {
                      return VendorsCard(
                        width: SizeManager.widthFromScreen(1.4, context),
                        imageUrl: AppStrings.kTestNetworkImage,
                        vendorName: 'القاعة الملكية',
                        location: 'الرياض',
                        rate:4.9,
                      );
                    },
                    separatorBuilder:(BuildContext c, int i) => 12.horizontalSpace,
                  ),
                ),
                24.verticalSpace,
                Text("عروض خاصة",style: AppTextTheme.bodyLargeSemiBold(context),),
                16.verticalSpace,
                SizedBox(
                  height: 220.h,
                  child: ListView.separated(
                    physics:BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext c, int i) {
                      return OfferCard(
                        imageUrl: AppStrings.kTestNetworkImage,
                        packageName: 'باقة العروس\nالملكية',
                        jobTitle: 'خبيرة مكياج',
                        personName: 'هبة سليمة',
                        personImageUrl: AppStrings.kTestNetworkImage,
                      );
                    },
                    separatorBuilder:(BuildContext c, int i) => 12.horizontalSpace,
                  ),
                ),



                10.verticalSpace,
              ],
            ),
          ),
        ),
      ],
    );
  }
}


