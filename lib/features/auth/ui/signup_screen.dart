import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabd/core/router/app_router.dart';
import 'package:nabd/core/utils/common_widgets/app_button.dart';
import 'package:nabd/core/utils/common_widgets/app_text_field.dart';
import 'package:nabd/core/utils/common_widgets/custom_appbar.dart';
import 'package:nabd/core/utils/common_widgets/on_tap.dart';
import 'package:nabd/core/utils/constants/app_colors.dart';
import 'package:nabd/core/utils/constants/app_text_them.dart';
import 'package:nabd/core/utils/constants/translations.dart';
import 'package:nabd/core/utils/extensions/padding_extensions.dart';
import 'package:nabd/core/utils/helper/validator.dart';
import 'package:nabd/features/auth/cubit/auth_cubit.dart';
import 'package:nabd/gen/locale_keys.g.dart';

import '../../../gen/assets.gen.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                      child: Assets.svg.arrowLeft.svg(height: 24.h),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SignUpBody()),
        ],
      ),
    );
  }
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 24.padHorizontal + 24.padTop,
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.hello.tr(),
              style: AppTextTheme.headingSmall(context),
            ),
            8.verticalSpace,
            Text(
              LocaleKeys.joinOurProviderCommunity.tr(),
              style: AppTextTheme.bodyMedium(
                context,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
            70.verticalSpace,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Form(
                  key: state.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        LocaleKeys.name.tr(),
                        style: AppTextTheme.bodyLarge(context),
                      ),
                      8.verticalSpace,
                      CustomTextField(
                        validator: Validator.validateName,
                        onChanged: context.read<AuthCubit>().setName,
                        hint: LocaleKeys.enterName.tr(),
                      ),
                      24.verticalSpace,
                      Text(
                        LocaleKeys.mobileNumber.tr(),
                        style: AppTextTheme.bodyLarge(context),
                      ),
                      8.verticalSpace,
                      CustomTextField(
                        validator: Validator.validateSaudiMobile,
                        maxLength: 10,
                        onChanged: context.read<AuthCubit>().setPhone,
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        isPhone: true,
                        hint: LocaleKeys.phoneNumber.tr(),
                      ),
                      Text(
                        LocaleKeys.categories.tr(),
                        style: AppTextTheme.bodyLarge(context),
                      ),
                      16.verticalSpace,

                    ],
                  ),
                );
              },
            ),
            50.verticalSpace,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final bool isFormValid =
                    (state.phone?.length == 10) &&
                        (state.name?.isNotEmpty ?? false) &&
                        state.categoryIds.isNotEmpty;
                return AppButton(
                  isLoading: state.currState is Loading,
                  isDisable: !isFormValid,
                  onTap: () {
                    if (state.formKey.currentState?.validate() ?? false) {
                      context.read<AuthCubit>().signUpAsync().then((value) {
                        if (value) {
                          VerificationRoute(
                            phone: state.phone ?? "",
                          ).push(context);
                        }
                      });
                    }
                  },
                  text: LocaleKeys.continueKey.tr(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
