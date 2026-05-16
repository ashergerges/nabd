import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/venues/cubit/venues_cubit.dart';
import 'package:nawy/features/venues/ui/widgets/body_filter.dart';



void showFilterBottomSheet(
  BuildContext context,{
      required int  categoryId
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => SearchFilterSheet(
      context: context,
        categoryId:  categoryId
    ),
  );
}

class SearchFilterSheet extends StatefulWidget {
  const SearchFilterSheet({
    super.key,
    required this.context, required this.categoryId,
  });

  final BuildContext context;
  final int  categoryId;

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  @override
  void initState() {
    super.initState();
    // Called only ONCE — not on every rebuild
    widget.context.read<VenuesCubit>().initialFilter();
  }
  @override
  Widget build(BuildContext _) {
    return BlocProvider.value(
      value: widget.context.read<VenuesCubit>(),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MediaQuery.viewPaddingOf(widget.context).top.verticalSpace,
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: OnTap(
              onTap: () {
                Navigator.pop(widget.context);
              },
              child: Padding(
                padding: 10.padEnd,
                child: Icon(
                  Icons.close,
                  color: AppColors.neutral50,
                  size: 24.h,
                ),
              ),
            ),
          ),
          15.verticalSpace,
          Flexible(
            child: Container(
              padding: 24.padHorizontal + 24.padTop,
              decoration: BoxDecoration(
                color: AppColors.primary50,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20.r) ,topRight:Radius.circular(20.r) ),
              ),
              child:  BodyFilter(categoryId: widget.categoryId,) ,
            ),
          ),
        ],
      ),
    );
  }
}
