import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/home/data/models/filter_chip_model.dart';
import 'package:nawy/features/home/ui/widgets/location_selector.dart';

class FilterChipBar extends StatefulWidget {
  final List<FilterChipModel> items;
  final int? initialId; // null or 0 = "All" selected
  final ValueChanged<int> onSelected; // returns 0 for "All"

  const FilterChipBar({
    super.key,
    required this.items,
    required this.onSelected,
    this.initialId,
  });

  @override
  State<FilterChipBar> createState() => _FilterChipBarState();
}

class _FilterChipBarState extends State<FilterChipBar> {
  late int _selectedId;

  @override
  void initState() {
    super.initState();
    // If initialId is null, 0, or not found in items → select "All"
    final exists = widget.items.any((e) => e.id == widget.initialId);
    _selectedId = (widget.initialId != null && exists) ? widget.initialId! : 0;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: 0.padHorizontal,
      child: Row(
        children: [
          LocationSelectorWidget(),
          _buildChip(id: 0, name: 'عرض الكل'),
          ...widget.items.map((item) => _buildChip(id: item.id, name: item.name)),
        ],
      ),
    );
  }

  Widget _buildChip({required int id, required String name}) {
    final isSelected = _selectedId == id;
    return OnTap(
      onTap: () {
        setState(() => _selectedId = id);
        widget.onSelected(id);
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
          name,
          style: AppTextTheme.bodyMedium(context).copyWith(
            color: isSelected ? AppColors.white :null,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          )
        ),
      ),
    );
  }
}

