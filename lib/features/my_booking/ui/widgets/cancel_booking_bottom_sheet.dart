import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../../core/utils/common_widgets/on_tap.dart';
import '../../../../core/utils/constants/app_text_them.dart';

/// Cancel booking bottom sheet
///
/// Shows a bottom sheet to collect cancellation reason
/// Performance: const constructors, extracted widgets
class CancelBookingBottomSheet extends StatefulWidget {
  const CancelBookingBottomSheet({
    super.key,
    required this.bookingId,
    required this.onCancel,
  });

  final int bookingId;
  final Function(int bookingId, String? reason) onCancel;

  /// Show the bottom sheet
  static Future<void> show(
      BuildContext context, {
        required int bookingId,
        required Function(int bookingId, String? reason) onCancel,
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CancelBookingBottomSheet(
        bookingId: bookingId,
        onCancel: onCancel,
      ),
    );
  }

  @override
  State<CancelBookingBottomSheet> createState() =>
      _CancelBookingBottomSheetState();
}

class _CancelBookingBottomSheetState extends State<CancelBookingBottomSheet> {
  late final TextEditingController _reasonController;
  late final FocusNode _focusNode;
  String? _selectedReason;

  final List<String> _cancellationReasons = [
    LocaleKeys.changedMyMind.tr(),
    LocaleKeys.foundBetterOption.tr(),
    LocaleKeys.priceTooHigh.tr(),
    LocaleKeys.bookedByMistake.tr(),
    LocaleKeys.personalEmergency.tr(),
    LocaleKeys.otherKey.tr(),
  ];

  @override
  void initState() {
    super.initState();
    _reasonController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _reasonController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleCancel() {
    final reason = _selectedReason == LocaleKeys.otherKey.tr()
        ? _reasonController.text.trim()
        : _selectedReason;

    widget.onCancel(widget.bookingId, reason);
    Navigator.of(context).pop();
  }

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
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SheetHeader(),
              24.verticalSpace,
              _ReasonsList(
                selectedReason: _selectedReason,
                reasons: _cancellationReasons,
                onReasonSelected: (reason) {
                  setState(() {
                    _selectedReason = reason;
                    if (reason == LocaleKeys.otherKey.tr()) {
                      _focusNode.requestFocus();
                    }
                  });
                },
              ),
              if (_selectedReason == LocaleKeys.otherKey.tr()) ...[
                16.verticalSpace,
                _CustomReasonInput(
                  controller: _reasonController,
                  focusNode: _focusNode,
                ),
              ],
              24.verticalSpace,
              _BottomActions(
                onCancel: () => Navigator.of(context).pop(),
                onConfirm: _handleCancel,
                isEnabled: _selectedReason != null &&
                    (_selectedReason != LocaleKeys.otherKey.tr() ||
                        _reasonController.text.trim().isNotEmpty),
              ),
              16.verticalSpace,
            ],
          ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.cancelBooking.tr(),
                style: AppTextTheme.headingSmall(context)
                    .copyWith(color: AppColors.neutral900),
              ),
              8.verticalSpace,
              Text(
                LocaleKeys.pleaseSelectReasonForCancellation.tr(),
                style: AppTextTheme.bodyMedium(context)
                    .copyWith(color: AppColors.neutral400),
              ),
            ],
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

/// List of cancellation reasons
class _ReasonsList extends StatelessWidget {
  const _ReasonsList({
    required this.selectedReason,
    required this.reasons,
    required this.onReasonSelected,
  });

  final String? selectedReason;
  final List<String> reasons;
  final ValueChanged<String> onReasonSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: 24.padHorizontal,
      itemCount: reasons.length,
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemBuilder: (context, index) {
        final reason = reasons[index];
        return _ReasonItem(
          key: ValueKey('reason_$index'),
          reason: reason,
          isSelected: selectedReason == reason,
          onTap: () => onReasonSelected(reason),
        );
      },
    );
  }
}

/// Single reason item
class _ReasonItem extends StatelessWidget {
  const _ReasonItem({
    super.key,
    required this.reason,
    required this.isSelected,
    required this.onTap,
  });

  final String reason;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        padding: 16.padAll,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.neutral50,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.neutral200,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            _RadioIndicator(isSelected: isSelected),
            12.horizontalSpace,
            Expanded(
              child: Text(
                reason,
                style: AppTextTheme.bodyMedium(context).copyWith(
                  color: isSelected
                      ? AppColors.white
                      : AppColors.neutral600,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Radio indicator circle
class _RadioIndicator extends StatelessWidget {
  const _RadioIndicator({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.white : AppColors.neutral300,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: 10.w,
          height: 10.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
        ),
      )
          : null,
    );
  }
}

/// Custom reason text input
class _CustomReasonInput extends StatelessWidget {
  const _CustomReasonInput({
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.padHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.pleaseSpecifyYourReason.tr(),
            style: AppTextTheme.bodySmall(context)
                .copyWith(color: AppColors.neutral600),
          ),
          8.verticalSpace,
          TextField(
            controller: controller,
            focusNode: focusNode,
            maxLines: 4,
            maxLength: 200,
            decoration: InputDecoration(
              hintText:LocaleKeys.typeYourReasonHere.tr(),
              hintStyle: AppTextTheme.bodyMedium(context)
                  .copyWith(color: AppColors.neutral300),
              filled: true,
              fillColor: AppColors.neutral50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.neutral200,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.neutral200,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: 12.padAll,
            ),
            style: AppTextTheme.bodyMedium(context),
          ),
        ],
      ),
    );
  }
}

/// Bottom action buttons
class _BottomActions extends StatelessWidget {
  const _BottomActions({
    required this.onCancel,
    required this.onConfirm,
    required this.isEnabled,
  });

  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.padHorizontal,
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              onTap: onCancel,
              text: LocaleKeys.goBack.tr(),
              background: AppColors.neutral50,
              textColor: AppColors.neutral900,
              height: 48.h,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: AppButton(
              onTap: isEnabled ? onConfirm : null,
              text: LocaleKeys.confirm.tr(),
              isDisable: !isEnabled,
              height: 48.h,
            ),
          ),
        ],
      ),
    );
  }
}