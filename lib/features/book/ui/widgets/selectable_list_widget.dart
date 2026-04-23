import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_network_image.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/data/model/selectable_item_model.dart';
class SelectableListWidget extends StatefulWidget {
  final List<SelectableItemModel> items;
  final int? initialSelected;
  final Function(SelectableItemModel selectedItem) onSelected;

  const SelectableListWidget({
    super.key,
    required this.items,
    required this.onSelected,
    this.initialSelected,
  });

  @override
  State<SelectableListWidget> createState() => _SelectableListWidgetState();
}
class _SelectableListWidgetState extends State<SelectableListWidget> {
  int? selectedId;

  @override
  void initState() {
    super.initState();
    selectedId = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final isSelected = selectedId == item.id;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedId = item.id;
            });

            widget.onSelected(item);
          },
          child: Container(
            padding: 24.padAll,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.primary100,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: AppTextTheme.bodyLargeMediumWeight(context).copyWith(
                    color: isSelected
                        ? AppColors.white
                        : null,
                  ),
                ),
                CustomNetworkImageCached(
                  imageUrl:  item.image,
                  height: 25.h,
                  width: 60.h,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => 12.verticalSpace,
    );
  }
}
