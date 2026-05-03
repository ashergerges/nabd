import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/cubit/vendor_details_cubit.dart';
import 'package:nawy/features/vendor_details/ui/widgets/package_card.dart';
import 'package:nawy/features/vendor_details/ui/widgets/service_price.dart';
import 'package:nawy/gen/locale_keys.g.dart';


// Sticky Tab Bar Delegate
class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailsCubit, VendorDetailsState>(
  builder: (context, state) {
    return Padding(
      padding:32.padStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.services.tr(),style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w600),),
          18.verticalSpace,
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              physics:BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.vendorDetails?.services?.length??0,
              itemBuilder: (BuildContext c, int index) {
                return ServicePrice(title:state.vendorDetails?.services?[index].name??"" ,price:state.vendorDetails?.services?[index].price??"" ,);
              },
              separatorBuilder:(BuildContext c, int i) => 12.horizontalSpace,
            ),
          ),
          24.verticalSpace,
          Text(LocaleKeys.packages.tr(),style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w600),),
          18.verticalSpace,
          Expanded(
            child: ListView.separated(
              physics:NeverScrollableScrollPhysics(),
              itemCount: state.vendorDetails?.packages?.length??0,
              padding: 16.padEnd,
              itemBuilder: (BuildContext c, int index) {
                return  PackageCard(
                  onTap: (){
                    VendorPackageDetailsRoute(vendorPackageId:state.vendorDetails?.packages?[index].id?? 0).push(context);

                  },
                  title: state.vendorDetails?.packages?[index].title??"",
                  capacity: state.vendorDetails?.packages?[index].guestCount??0,
                  location:state.vendorDetails?.packages?[index].address?? '',
                  rating: state.vendorDetails?.packages?[index].avgRate??0,
                  price: double.parse(state.vendorDetails?.packages?[index].priceAfter??"0"),
                  imageUrl: state.vendorDetails?.packages?[index].image??AppStrings.kTestNetworkImage,
                  discountPercent: double.parse(state.vendorDetails?.packages?[index].discount??""),
                  isFavorite: state.vendorDetails?.packages?[index].isFavorite??true,
                );
              },
              separatorBuilder:(BuildContext c, int i) => 12.verticalSpace,
            ),
          ),
         
        ],
      ),
    );
  },
);
  }
}




