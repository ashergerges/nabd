import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/empty_widget.dart';
import 'package:nawy/core/utils/common_widgets/list_view/animation_listview_1.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/categories/data/models/service_category_model.dart';
import 'package:nawy/features/vendor_details/ui/widgets/package_card.dart';
import 'package:nawy/features/venues/cubit/venues_cubit.dart';
import 'package:nawy/features/venues/ui/widgets/search_filter_sheet.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';

@RoutePage()
class VenuesScreen extends StatelessWidget {
  const VenuesScreen({super.key, required this.category});

  final ServiceCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.title),
      body: Padding(
        padding: 24.padHorizontal,
        child: BlocProvider(
          create: (context) => VenuesCubit()..venues(category.id),
          child: BlocBuilder<VenuesCubit, VenuesState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      OnTap(
                        onTap: () {
                          showFilterBottomSheet(
                            context,
                            categoryId: category.id,
                          );
                        },
                        child: Container(
                          padding: 2.padVertical+4.padAll,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(4.r),
                               border: Border.all(color: AppColors.primary,width: 1),
                             ),
                            child: Icon(Icons.filter_alt_outlined)),
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: AppTextField(
                          initialValue: state.searchTerm,
                          label: LocaleKeys.search.tr(),
                          onChange: (value) {
                            context.read<VenuesCubit>().setSearch(
                              category.id,
                              value,
                            );
                          },
                          imagePre: Assets.svg.search.path,
                          radius: 12,
                        ),
                      ),

                    ],
                  ),
                  10.verticalSpace,
                  Expanded(
                    child:state.currState is Loading?VenuesBodyShimmer(): 
                    
                   (state.venuesList.isEmpty?Center(
                     child: EmptyWidget(
                       text:LocaleKeys.noProductsFoundForYourSearch.tr(),
                       image:Assets.svg.error.svg() ,
                     ),
                   ): ListViewAnimation1(
                      itemCount: state.venuesList.length,
                      padding: 24.padTop + 5.padBottom,
                      itemBuilder: (_, index) => PackageCard(
                        onTap: () {
                          VendorDetailsRoute(
                            vendorDetailsId: category.id,
                          ).push(context).then((value) {
                            context.read<VenuesCubit>().venues(category.id);
                          });
                        },
                        title: state.venuesList[index].title ?? "",
                        capacity: state.venuesList[index].guestCount ?? 0,
                        location: state.venuesList[index].slug ?? "",
                        rating: state.venuesList[index].avgRating ?? 0,
                        price: double.parse(
                          state.venuesList[index].priceAfter ?? "0",
                        ),
                        imageUrl: state.venuesList[index].image ?? "0",
                        discountPercent: double.parse(
                          state.venuesList[index].discount ?? "0",
                        ),
                        isFavorite: state.venuesList[index].isFavorite ?? false,
                      ),
                      separatorBuilder: (_, _) => 12.verticalSpace,
                    )),
                  ),
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
        Expanded(
          child: ListViewAnimation1(
            itemCount: 5,
            padding: 24.padTop + 5.padBottom,
            itemBuilder: (_, _) => PackageCardShimmer(),
            separatorBuilder: (_, _) => 12.verticalSpace,
          ),
        ),
      ],
    );
  }
}
