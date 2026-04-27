class InviteSummaryData {
  final int totalInvited;
  final double progressPercent;
  final int waitingCount;
  final int acceptedCount;
  final int rejectedCount;

  const InviteSummaryData({
    required this.totalInvited,
    required this.progressPercent,
    required this.waitingCount,
    required this.acceptedCount,
    required this.rejectedCount,
  });
}
