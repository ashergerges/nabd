import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/features/auth/cubit/auth_cubit.dart';
import 'package:nabd/features/auth/ui/widgets/resend_timer.dart' show ResendCodeTimer;
import 'package:nabd/gen/locale_keys.g.dart';

class ResendButtonWidget extends StatelessWidget {
  const ResendButtonWidget({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Visibility(
          visible: !state.resendCode,
          replacement: TextButton(
            onPressed: () {
              context.read<AuthCubit>().reSendOtp(phone:phone );
              // cubit.resendCode(widget.phone);
            },
            child: Text(
              LocaleKeys.resendCode.tr(),
              style: TextStyle(fontSize: 16.sp, color: AppColors.primary),
            ),
          ),
          child: ResendCodeTimer(
            maxSeconds: 60,
            onTimeUp: () {
              context.read<AuthCubit>().setResendCode(true);
            },
          ),
        );
      },
    );
  }
}
