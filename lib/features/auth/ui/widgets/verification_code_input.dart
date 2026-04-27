import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/features/auth/cubit/auth_cubit.dart';
import 'package:nawy/features/auth/ui/widgets/otp_widget.dart';

class VerificationCodeInput extends StatelessWidget {
  const VerificationCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return OtpInput(
          length: 4,
          isSecure: false,
          onChanged: (value) {
            context.read<AuthCubit>().setOTP(value);
          },
          onCompleted: (v) {
            context.read<AuthCubit>().validateOtp(
                phone: state.phone ?? "", otp: v);
          },

        );
      },
    );
  }
}
