import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/list_view/animation_listview_1.dart';
import 'package:nawy/core/utils/common_widgets/list_view/animation_listview_3.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/constants.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/vendor_details/ui/widgets/package_card.dart';
import 'package:nawy/gen/assets.gen.dart';
@RoutePage()
class VenuesScreen extends StatelessWidget {
  const VenuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "قاعات الزفاف",),
      body: Padding(
        padding:24.padHorizontal,
        child: Column(
          children: [
            AppTextField(label: "ابحث",
             imagePre: Assets.svg.search.path,radius: 12,),
            Expanded(child: ListViewAnimation1(
                itemCount: 5,
                padding: 24.padTop+5.padBottom,
                itemBuilder: (_,_)=>PackageCard(
                  onTap: (){
                    VendorPackageDetailsRoute().push(context);

                  },
                  title: 'قاعة كريستال',
                  capacity: 500,
                  location: 'الرياض',
                  rating: 4.9,
                  price: 12000,
                  imageUrl:
                  AppStrings.kTestNetworkImage,
                  discountPercent: 30,
                  isFavorite: true,
                ), separatorBuilder: (_,_)=>12.verticalSpace)),

          ],
        ),
      ),
    );
  }
}
