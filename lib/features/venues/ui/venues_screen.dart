import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/list_view/animation_listview_1.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/categories/data/models/service_category_model.dart';
import 'package:nawy/features/vendor_details/ui/widgets/package_card.dart';
import 'package:nawy/features/venues/cubit/venues_cubit.dart';
import 'package:nawy/gen/assets.gen.dart';
@RoutePage()
class VenuesScreen extends StatelessWidget {
  const VenuesScreen({super.key, required this.category});
  final ServiceCategory category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.title,),
      body: Padding(
        padding:24.padHorizontal,
        child: BlocProvider(
  create: (context) => VenuesCubit()..venues(category.id),
  child: BlocBuilder<VenuesCubit, VenuesState>(
  builder: (context, state) {
    if(state.currState is Loading){
      return VenuesBodyShimmer();
    }
    return Column(
          children: [
            AppTextField(label: "ابحث",
             imagePre: Assets.svg.search.path,radius: 12,),
            Expanded(child: ListViewAnimation1(
                itemCount: state.venuesList.length,
                padding: 24.padTop+5.padBottom,
                itemBuilder: (_,index)=>PackageCard(
                  onTap: (){
                    VendorDetailsRoute(vendorDetailsId: category.id).push(context);

                  },
                  title: state.venuesList[index].nameAr??"",
                  capacity: state.venuesList[index].guestCount??0,
                  location: state.venuesList[index].slug??"",
                  rating: state.venuesList[index].avgRating??0,
                  price:double.parse(state.venuesList[index].priceAfter??"0"),
                  imageUrl:state.venuesList[index].image??"0",
                  discountPercent: double.parse(state.venuesList[index].discount??"0"),
                  isFavorite: state.venuesList[index].isFavorite??false,
                ), separatorBuilder: (_,_)=>12.verticalSpace)),

          ],
        );
  },
),
),
      ),
    );
  }
}

class VenuesBodyShimmer extends StatelessWidget {
  const VenuesBodyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(label: "ابحث",
          imagePre: Assets.svg.search.path,radius: 12,),
        Expanded(child: ListViewAnimation1(
            itemCount: 5,
            padding: 24.padTop+5.padBottom,
            itemBuilder: (_,_)=>PackageCardShimmer(
            ), separatorBuilder: (_,_)=>12.verticalSpace)),

      ],
    );
  }
}
