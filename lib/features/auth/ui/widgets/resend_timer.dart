import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';

class ResendCodeTimer extends StatefulWidget {
  final int maxSeconds;
  final VoidCallback onTimeUp;

  const ResendCodeTimer({
    super.key,
    required this.maxSeconds,
    required this.onTimeUp,
  });

  @override
  _ResendCodeTimerState createState() => _ResendCodeTimerState();
}

class _ResendCodeTimerState extends State<ResendCodeTimer> {
  late int secondsRemaining;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    secondsRemaining = widget.maxSeconds;
    startTimer();
  }

  @override
  void didUpdateWidget(covariant ResendCodeTimer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Detect when maxSeconds changes (like after clicking resend)
    if (oldWidget.maxSeconds != widget.maxSeconds) {
      timer?.cancel();
      secondsRemaining = widget.maxSeconds;
      startTimer();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        timer.cancel();
        widget.onTimeUp();
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    return "$minutes:${(seconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(secondsRemaining),
      style: AppTextTheme.bodySmall(context).copyWith(color: Colors.white),
    );
  }
}

