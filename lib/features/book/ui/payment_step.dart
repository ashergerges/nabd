import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/data/model/selectable_item_model.dart';
import 'package:nawy/features/book/ui/widgets/selectable_list_widget.dart';
class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // physics: BouncingScrollPhysics(),
      padding: 24.padHorizontal + 24.padTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("طريقة الدفع", style: AppTextTheme.bodyLargeSemiBold(context)),
          12.verticalSpace,
          SelectableListWidget(
            initialSelected: 2,
            items: [
              SelectableItemModel(
                id: 1,
                name: "مدى",
                image: "https://i.pravatar.cc/150?img=5",
              ),
              SelectableItemModel(
                id: 2,
                name: "أبل باي",
                image: "https://i.pravatar.cc/150?img=2",
              ),
              SelectableItemModel(
                id: 3,
                name: "التحويل المصرفي",
                image: "https://i.pravatar.cc/150?img=7",
              ),
            ],
            onSelected: (item) {
              print(item.id);
              print(item.name);
              print(item.image);
            },
          ),
          12.verticalSpace,
          Spacer(),
          Container(
            padding: 16.padAll,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "المجموع",
                  style: AppTextTheme.bodyLarge(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
                Text(
                  "1700 رس",
                  style: AppTextTheme.bodyLargeMediumWeight(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
