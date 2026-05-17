import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/features/profile/cubits/invitation_tracking/invitation_tracking_cubit.dart';
import 'package:nawy/features/profile/data/models/invite_summary_data.dart';
import 'package:nawy/features/profile/ui/widgets/invite_summary_shimmer_widget.dart';
import 'package:nawy/features/profile/ui/widgets/invite_summary_widget.dart';
import 'package:nawy/gen/locale_keys.g.dart';

@RoutePage()
class InvitationTrackingScreen extends StatelessWidget {
  const InvitationTrackingScreen({super.key, this.bookingId});

  final int? bookingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InvitationTrackingCubit()..invitation(bookingId: bookingId),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.trackInvitations.tr()),
        body: BlocBuilder<InvitationTrackingCubit, InvitationTrackingState>(
          builder: (context, state) {
            if (state.currState is Loading) {
              return const InviteSummaryWidgetShimmer();
            }
            return SingleChildScrollView(
              child: InviteSummaryWidget(
                acceptedList: state.acceptedList,
                pendingList: state.pendingList,
                rejectedList: state.rejectedList,
                invitationId: state.invitationData?.id ?? 0,
                data: InviteSummaryData(
                  totalInvited: state.totalInvited,
                  progressPercent: state.progressPercent,
                  waitingCount: state.waitingCount,
                  acceptedCount: state.acceptedCount,
                  rejectedCount: state.rejectedCount,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


