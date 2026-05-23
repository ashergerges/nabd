import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/common_widgets/shimmer_widget.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/categories/data/models/category_model.dart';



/// Multi-select category widget
///
/// Features:
/// - Select/deselect categories
/// - Returns list of selected IDs
/// - Supports initial selection
/// - Toggle behavior (tap to select/deselect)
///
/// Performance optimizations:
/// - const constructors
/// - Extracted sub-widgets
/// - ValueKey for list items
class CategorySelector extends StatefulWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.onSelectionChanged,
    this.initialSelectedIds = const [],
    this.title,
    this.multiSelect = true,
  });

  final List<CategoryModel> categories;
  final ValueChanged<List<int>> onSelectionChanged;
  final List<int> initialSelectedIds;
  final String? title;
  final bool multiSelect;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late Set<int> _selectedIds;

  @override
  void initState() {
    super.initState();
    _selectedIds = Set<int>.from(widget.initialSelectedIds);
  }

  void _toggleCategory(int id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        // Remove if already selected
        _selectedIds.remove(id);
      } else {
        // Add if not selected
        if (widget.multiSelect) {
          _selectedIds.add(id);
        } else {
          // Single select - clear and add
          _selectedIds.clear();
          _selectedIds.add(id);
        }
      }
    });

    // Callback with selected IDs
    widget.onSelectionChanged(_selectedIds.toList());
  }

  @override
  Widget build(BuildContext context) {
    return  _CategoryList(
      categories: widget.categories,
      selectedIds: _selectedIds,
      onToggle: _toggleCategory,
    );
  }
}


/// Category list
class _CategoryList extends StatelessWidget {
  const _CategoryList({
    required this.categories,
    required this.selectedIds,
    required this.onToggle,
  });

  final List<CategoryModel> categories;
  final Set<int> selectedIds;
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: categories.map((category) {
        return _CategoryChip(
          key: ValueKey('category_${category.id}'),
          category: category,
          isSelected: selectedIds.contains(category.id),
          onTap: () => onToggle(category.id??0),
        );
      }).toList(),
    );
  }
}

/// Single category chip
class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: 12.padHorizontal + 8.padVertical,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.neutral50,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.neutral200,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          category.name??"",
          style: AppTextTheme.bodySmall(context).copyWith(
            color: isSelected ? AppColors.white : AppColors.neutral700,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class CategorySelectorShimmer extends StatelessWidget {
  const CategorySelectorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final widths = [70, 90, 110, 80, 100, 75];

    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(8, (index) {
        return ShimmerWidget.rectangular(
          width: widths[index % widths.length].w,
          height: 38.h,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        );
      }),
    );
  }
}