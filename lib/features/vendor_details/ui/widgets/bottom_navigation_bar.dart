import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class VendorBottomNavigationBar extends StatelessWidget {
  const VendorBottomNavigationBar({
    super.key,
    required this.callPhone,
    required this.whatsappPhone, required this.isLoading,
  });

  final String callPhone;
  final String whatsappPhone;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: AppButton(
        isLoading:isLoading ,
        onTap: () {
          _showContactOptionsSheet(context);
        },
        text: LocaleKeys.contactServiceProvider.tr(),
      ),
    );
  }

  void _showContactOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _ContactOptionsBottomSheet(
        callPhone: callPhone,
        whatsappPhone: whatsappPhone,
      ),
    );
  }
}

/// Contact options bottom sheet
///
/// Performance optimizations:
/// - const constructors
/// - Extracted sub-widgets
/// - Minimal rebuilds
class _ContactOptionsBottomSheet extends StatelessWidget {
  const _ContactOptionsBottomSheet({
    required this.callPhone,
    required this.whatsappPhone,
  });

  final String callPhone;
  final String whatsappPhone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _SheetHeader(),
            16.verticalSpace,
            _ContactOptionsList(
              callPhone: callPhone,
              whatsappPhone: whatsappPhone,
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}

/// Sheet header with drag handle and title
class _SheetHeader extends StatelessWidget {
  const _SheetHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.verticalSpace,
        _DragHandle(),
        16.verticalSpace,
        Padding(
          padding: 24.padHorizontal,
          child: Text(
            LocaleKeys.chooseContactMethod.tr(),
            style: AppTextTheme.headingSmall(context)
                .copyWith(color: AppColors.neutral900),
          ),
        ),
      ],
    );
  }
}

/// Drag handle indicator
class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: AppColors.neutral200,
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}

/// Contact options list
class _ContactOptionsList extends StatelessWidget {
  const _ContactOptionsList({
    required this.callPhone,
    required this.whatsappPhone,
  });

  final String callPhone;
  final String whatsappPhone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.padHorizontal,
      child: Column(
        children: [
          _ContactOptionItem(
            icon: Assets.svg.whatsIcon.svg(
              width: 24.w,
              height: 24.h,
            ),
            title: LocaleKeys.whatsapp.tr(),
            subtitle: whatsappPhone,
            onTap: () {
              Navigator.pop(context);
              UrlLauncher.shareToWhatsApp(
                whatsappPhone,
                message: LocaleKeys.hello.tr(),
              );
            },
          ),
          16.verticalSpace,
          _ContactOptionItem(
            icon: Assets.svg.phone.svg(
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            title: LocaleKeys.phoneCall.tr(),
            subtitle: callPhone,
            onTap: () {
              Navigator.pop(context);
              UrlLauncher.makePhoneCall(callPhone);
            },
          ),
        ],
      ),
    );
  }
}

/// Single contact option item
class _ContactOptionItem extends StatelessWidget {
  const _ContactOptionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        padding: 16.padAll,
        decoration: BoxDecoration(
          color: AppColors.neutral50,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.neutral200,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            _IconContainer(icon: icon),
            16.horizontalSpace,
            Expanded(
              child: _ContactInfo(
                title: title,
                subtitle: subtitle,
              ),
            ),
            _ChevronIcon(),
          ],
        ),
      ),
    );
  }
}

/// Icon container with background
class _IconContainer extends StatelessWidget {
  const _IconContainer({required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(child: icon),
    );
  }
}

/// Contact title and phone number
class _ContactInfo extends StatelessWidget {
  const _ContactInfo({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextTheme.bodyMediumSemiBold(context)
              .copyWith(color: AppColors.neutral900),
        ),
        4.verticalSpace,
        Text(
          subtitle,
          style: AppTextTheme.bodySmall(context)
              .copyWith(color: AppColors.neutral),
        ),
      ],
    );
  }
}

/// Chevron icon
class _ChevronIcon extends StatelessWidget {
  const _ChevronIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_right,
      size: 20.sp,
      color: AppColors.neutral400,
    );
  }
}