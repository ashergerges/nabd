import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/home/data/models/city_model.dart';
import 'package:nawy/features/home/data/models/filter_chip_model.dart';
import 'package:nawy/features/home/ui/widgets/location_selector.dart';

class FilterChipBar extends StatelessWidget {
  final List<FilterChipModel> items;
  final FilterChipModel? initial; // null or 0 = "All" selected
  final ValueChanged<FilterChipModel> onSelected; // returns 0 for "All"
  final Function(CityModel) onChangeLocation;
  final List<CityModel> locations;
  final CityModel? selectedLocation;
  const FilterChipBar({
    super.key,
    required this.items,
    required this.onSelected,
    this.initial, required this.onChangeLocation, required this.locations, required this.selectedLocation,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: 0.padHorizontal,
      child: Row(
        children: [
          LocationSelectorWidget(
            onChange:onChangeLocation ,
            locations:locations ,
            selectedLocation:selectedLocation ,
          ),
          _buildChip(item: FilterChipModel(id: 0, name: 'عرض الكل'),context:context,isSelected: initial?.id==null?false:(0==(initial?.id))),
          ...items.map((item) => _buildChip(context:context ,item: item, isSelected: initial?.id==null?false:(item.id==(initial?.id)))),
        ],
      ),
    );
  }

  Widget _buildChip({required BuildContext context,required bool isSelected,required FilterChipModel item}) {
    return OnTap(
      onTap: () {
        onSelected(item);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: 8.padStart,
        padding:18.padHorizontal+6.padVertical,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
            item.name,
          style: AppTextTheme.bodyMedium(context).copyWith(
            color: isSelected ? AppColors.white :null,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          )
        ),
      ),
    );
  }
}

class FilterChipBarShimmer extends StatelessWidget {
  const FilterChipBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: 0.padHorizontal,
      child: Row(
        children: List.generate(6, (index) {
          return Padding(
            padding: 8.padStart,
            child: ShimmerWidget.rectangular(
              width: _getRandomWidth(index),
              height: 32,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          );
        }),
      ),
    );
  }

  double _getRandomWidth(int index) {
    // Different widths to simulate text length
    const widths = [70.0, 90.0, 60.0, 110.0, 80.0, 95.0];
    return widths[index % widths.length];
  }
}