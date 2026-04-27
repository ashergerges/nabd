import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/core/utils/helper/validator.dart';
import 'package:nawy/features/auth/cubit/auth_cubit.dart';

import '../../../gen/assets.gen.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(
            child: Row(
              children: [
                OnTap(
                  onTap: () {
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
          Expanded(child: LoginBody()),

        ],
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.padHorizontal + 24.padTop,
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("مرحباً!", style: AppTextTheme.headingSmall(context),),
            8.verticalSpace,
            Text("أدخل رقمك للمتابعة",
              style: AppTextTheme.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w600),),
            70.verticalSpace,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Form(
                  key: state.formKey,
                  child: CustomTextField(
                    validator: Validator.validateSaudiMobile,
                    maxLength: 10,
                    onChanged: context
                        .read<AuthCubit>()
                        .setPhone,
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    isPhone: true,
                    hint: "رقم التليفون",
                  ),
                );
              },
            ),
            50.verticalSpace,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state.currState is Loading,
                  background: state.phone?.length != 10
                      ? AppColors.neutral100
                      : null,
                  onTap: () {
                    if (state.formKey.currentState?.validate() ?? false) {
                      context.read<AuthCubit>().loginAsync().then((value){
                        if(value){
                          VerificationRoute(phone: state.phone??"").push(context);

                        }
                      });
                    }
                  },
                  text: "المتابعة",
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

