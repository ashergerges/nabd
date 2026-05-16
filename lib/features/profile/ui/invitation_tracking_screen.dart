import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as dir;
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/create_invitation/ui/contact_selected_sheet.dart';
import 'package:nawy/features/profile/data/models/invite_summary_data.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/gen/locale_keys.g.dart';

@RoutePage()
class InvitationTrackingScreen extends StatelessWidget {
  const InvitationTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:LocaleKeys.trackInvitations.tr()),
      body: SingleChildScrollView(
        child: InviteSummaryWidget(
          data: const InviteSummaryData(
            totalInvited: 300,
            progressPercent: 0.60,
            waitingCount: 120,
            acceptedCount: 150,
            rejectedCount: 30,
          ),
        ),
      ),
    );
  }
}


class InviteSummaryWidget extends StatelessWidget {
  final InviteSummaryData data;

  const InviteSummaryWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: dir.TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            OnTap(
            onTap: (){
              showContactSelectedSheet(context,[Contact(id: "sa",name: Name(first: "as",last: "sa"),phones: [Phone("012221")])]);
      }
            ,child: _TopProgressCard(data: data)),
            16.verticalSpace,
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _StatCard(
                      iconAsset: Assets.svg.rounded.path,
                      label: LocaleKeys.invitationAccepted.tr(),
                      value: data.acceptedCount,
                      gradientColors:  [
                        AppColors.white,
                        Color(0x1A16A34A),
                      ],
                      gradientBegin: Alignment.centerLeft,
                      gradientEnd: Alignment.centerRight,
                      borderColor: const Color(0xFFD1FAE5),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: _StatCard(
                            size: 40.h,
                            iconAsset: Assets.svg.comingSoon.path,
                            label: LocaleKeys.pending.tr(),
                            value: data.waitingCount,
                            // LTR: left=white, right=grey  ← visually in RTL layout
                            gradientColors: const [
                              Color(0x80FFFFFF), // white 50%
                              Color(0x80C0C0C0), // grey  50%
                            ],
                            gradientBegin: Alignment.centerLeft,
                            gradientEnd: Alignment.centerRight,
                            borderColor: const Color(0xFFE5E7EB),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // REJECTED — red gradient
                        Expanded(
                          child: _StatCard(
                            size: 35.h,
                            iconAsset: Assets.svg.unavailable.path,
                            label: LocaleKeys.rejected.tr(),
                            value: data.rejectedCount,
                            gradientColors: const [
                              Color(0x1AFFFFFF), // white 10%
                              Color(0x1ADC2626), // red   10%
                            ],
                            gradientBegin: Alignment.centerLeft,
                            gradientEnd: Alignment.centerRight,
                            borderColor: const Color(0xFFFFD3FA),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _StatCard extends StatelessWidget {
  final String iconAsset;
  final String label;
  final int value;
  final double? size;
  final List<Color> gradientColors;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final Color borderColor;

  const _StatCard({
    required this.iconAsset,
    required this.label,
    required this.value,
    required this.gradientColors,
    required this.gradientBegin,
    required this.gradientEnd,
    required this.borderColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: gradientBegin,
          end: gradientEnd,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow:  [
          BoxShadow(
            color:AppColors.shadow,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
            Positioned(
              top: size!=null ? 20 : null,
              bottom:size==null? 20 : null,
              left: 10,
              child: Container(
                padding: 12.padAll,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle
                ),
                child: Transform.rotate(
                  angle: 0.785398, // -45 degrees = top-left arrow
                  child: Icon(
                    Icons.arrow_forward,
                    size: 14.h,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),

          // ── main content ───────────────────
          Padding(
            padding:18.padAll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // icon
                SvgPicture.asset(iconAsset, width: size??80.h, height:size?? 80.h),
                20.verticalSpace,
                // label
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w300)
                ),
                const SizedBox(height: 6),
                // value
                Text(
                  '$value',
                  style:AppTextTheme.headingLarge(context).copyWith(fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopProgressCard extends StatelessWidget {
  final InviteSummaryData data;

  const _TopProgressCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 20.padAll,
      decoration: BoxDecoration(
        color: const Color(0xFFFDF0FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFD3FA)),
        boxShadow:  [BoxShadow(color:AppColors.shadow, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.totalGuestsInvited.tr(args: ['${data.totalInvited}']),
                  style: AppTextTheme.bodyLargeSemiBold(context),
                ),
                6.verticalSpace,
                Text(
                  LocaleKeys.guestListGrowingWhoIsNext.tr(),
                  style: AppTextTheme.bodySmall(
                    context,
                  ).copyWith(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: 50.padHorizontal + 5.padVertical,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.pink],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    LocaleKeys.inviteMore.tr(),
                    style: AppTextTheme.bodyMediumSemiBold(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          16.horizontalSpace,
          SizedBox(
            width: 90.h,
            height: 90.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 90.h,
                  height: 90.h,
                  child: CircularProgressIndicator(
                    value: data.progressPercent,
                    strokeWidth: 8,
                    backgroundColor: const Color(0xFFEED6FF),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFFB44FD8),
                    ),
                  ),
                ),
                Text(
                  '${(data.progressPercent * 100).toInt()}%',
                  style: AppTextTheme.headingSmall(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
