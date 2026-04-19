
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/features/auth/ui/widgets/otp_widget.dart';

class VerificationCodeInput extends StatelessWidget {
  const VerificationCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpInput(
      length: 4,
      isSecure: false,
      onChanged: (value){
        // context.read<AuthenticationCubit>().setOTP();
      },
      onCompleted: (v) {
        // context.read<AuthenticationCubit>().validateOtp(phone: state.phone??"",otp: v);
      },

    );
  }
}
