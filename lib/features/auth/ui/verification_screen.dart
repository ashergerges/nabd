import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/auth/cubit/auth_cubit.dart';
import 'package:nawy/features/auth/ui/widgets/resend_button_widget.dart';
import 'package:nawy/features/auth/ui/widgets/verification_code_input.dart';
import 'package:nawy/gen/locale_keys.g.dart';

import '../../../core/utils/common_widgets/on_tap.dart';
import '../../../gen/assets.gen.dart';
@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // spacing: 20.h,
        children: [
          CustomTopBar(
            child:  Row(
              children: [
                OnTap(
                  onTap: (){
                    context.maybePop();
                  },
                  child: Container(
                    padding: 5.padAll,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.flip(
                        flipX: context.isEnglish,
                        child: Assets.svg.arrowLeft.svg(height: 24.h)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: VerificationBody(phone:phone)),

        ],
      ),
    );
  }
}
class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key, required this.phone});
 final String phone;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthCubit()..setPhone(phone),
  child: BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    return Padding(
      padding: 24.padHorizontal+24.padTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.checkYourPhone.tr(),
            style: AppTextTheme.headingMedium(context).copyWith(fontWeight: FontWeight.w600),
          ),
          8.verticalSpace,
          Text(
            LocaleKeys.codeSent.tr(args: [phone]),
            style: AppTextTheme.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          40.verticalSpace,
          Center(child: VerificationCodeInput()),
          ResendButtonWidget(phone: phone),
          40.verticalSpace,
          AppButton(
            background: state.oTPCode.length != 4
                ? AppColors.neutral100
                : null,isDisable:state.oTPCode.length != 4 ,
            isLoading: state.currState is Loading,
            onTap: () {
              context.read<AuthCubit>().validateOtp(
                  phone: state.phone ?? "", otp: state.oTPCode);
            },
            text: LocaleKeys.confirm.tr(),
          )
        ],
      ),
    );
  },
),
);
  }
}
