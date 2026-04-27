import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/notification/data/models/notification_item_model.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const groups = [
      NotificationGroup(
        sectionTitle: 'اليوم',
        items: [
          NotificationItem(title: 'تم قبول دعوتك من قبل أحمد', time: 'منذ 9 د'),
          NotificationItem(title: 'تم قبول دعوتك من قبل أحمد', time: 'منذ 9 د'),
        ],
      ),
      NotificationGroup(
        sectionTitle: 'أمس',
        items: [
          NotificationItem(title: 'تم قبول دعوتك من قبل أحمد'),
          NotificationItem(title: 'تم قبول دعوتك من قبل أحمد'),
        ],
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar(title: "الاشعارات"),
      body: NotificationListWidget(groups: groups),
    );
  }
}

class NotificationGroup {
  final String sectionTitle; // "Today" / "Yesterday"
  final List<NotificationItem> items;

  const NotificationGroup({required this.sectionTitle, required this.items});
}

class NotificationListWidget extends StatelessWidget {
  final List<NotificationGroup> groups;

  const NotificationListWidget({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding:16.padHorizontal+12.padVertical,
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index != 0) 24.verticalSpace,
            _SectionHeader(title: group.sectionTitle),
            12.verticalSpace,
            // ── notification cards ─────────────
            ...group.items.map(
              (item) => Padding(
                padding: 12.padBottom,
                child: _NotificationCard(item: item),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.primary)
        ),
        10.horizontalSpace,
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.primary100,
          ),
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const _NotificationCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 14.padHorizontal + 16.padVertical,
      margin: 5.padVertical,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral50,
            blurRadius: 30,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.h,
            height: 48.h,
            decoration: BoxDecoration(
              color:AppColors.secondary15,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.notifications_outlined,
                size: 24.h,
                color: AppColors.secondary30,
              ),
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Text(
              item.title,
              style:AppTextTheme.bodyMedium(context)
            ),
          ),

          // ── time (optional) ─────────────────
          if (item.time != null) ...[
            8.horizontalSpace,
            Text(
              item.time!,
              style: AppTextTheme.bodyXSmall(context)
            ),
          ],
        ],
      ),
    );
  }
}
