import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/core/utils/helper/validator.dart';
import 'package:nawy/features/profile/cubits/update_profile/update_profile_cubit.dart';
import 'package:nawy/features/profile/ui/widgets/profile_image_picker.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:nawy/main_common.dart';

@RoutePage()
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          final cubit = context.read<UpdateProfileCubit>();

          return Scaffold(
            appBar: CustomAppBar(title: LocaleKeys.editProfile.tr()),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: 24.padHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    35.verticalSpace,
                    Center(
                      child: CircleProfileImagePicker(
                        size: 150.h,
                        initialImageUrl: getIt<ILocalPreference>().appUser.value
                            ?.image,
                        onImageUploaded: (imagePath) {
                          //onUpload
                          log("imagePath::$imagePath");
                          context.read<UpdateProfileCubit>().updateProfileImage(
                              path: imagePath);
                        },
                      ),
                    ),
                    20.verticalSpace,
                    Text(LocaleKeys.name.tr()),
                    CustomTextField(
                      initialValue: getIt<ILocalPreference>().appUser.value?.name,
                      validator: Validator.validateName,
                      onChanged: cubit.setName,
                      hint: LocaleKeys.enterName.tr(),
                    ),
                    SizedBox(height: 24),

                    Text(LocaleKeys.mobileNumber.tr()),
                    CustomTextField(
                      initialValue: getIt<ILocalPreference>().appUser.value?.phone,
                      validator: Validator.validateSaudiMobile,
                      maxLength: 10,
                      onChanged: cubit.setPhone,
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      isPhone: true,
                      hint:LocaleKeys.phoneNumber.tr(),
                    ),
                    SizedBox(height: 24),

                    Text(LocaleKeys.address.tr()),
                    CustomTextField(
                      initialValue: getIt<ILocalPreference>().appUser.value?.address,
                      validator: Validator.validate,
                      onChanged: cubit.setAddress,
                      hint: LocaleKeys.enterAddress.tr(),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: 16.padAll,
              child: AppButton(
                  isDisable: !cubit.hasChanges(),
                  isLoading: state.currState is Loading,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      cubit.updateProfileDate();
                    }
                  },
                  text: LocaleKeys.save.tr()
              ),
            ),
          );
        },
      ),
    );
  }
}