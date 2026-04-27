import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/features/auth/data/repositories/interfaces/i_login_repository.dart';
import 'package:nawy/main_common.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() :
        loginRepository = getIt<ILoginRepository>(),
        super(AuthState(formKey: GlobalKey<FormState>()));

  final ILoginRepository loginRepository;
  void setPhone(String? value) {
    emit(state.copyWith(phone: value));
  }
  void setOTP(String? value) {
    emit(state.copyWith(oTPCode: value ?? ""));
  }

  void setResendCode(bool? value) {
    emit(state.copyWith(resendCode: value ?? false));
  }
  Future<bool> loginAsync() async {
    emit(state.copyWith(currState: Loading()));

    var loginAsync = await loginRepository.loginAsync(phone: state.phone ?? "");
    if (loginAsync.isError) {
      MessageService.showToast(
        msg: loginAsync.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));

      return false;
    }
    emit(state.copyWith( currState: Success()));
    return true;
  }
  Future<void> reSendOtp({required String phone}) async {
    emit(state.copyWith(currState: Loading()));
    var registerAsync = await loginRepository.reSendOTP(phone: phone);
    if (registerAsync.isError) {
      MessageService.showToast(
        msg: registerAsync.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return;
    }
    emit(state.copyWith(resendCode: false, currState: Success()));

    log(
      "registerAsync.asValue?.value SendAgainOTP${registerAsync.asValue?.value}",
    );
  }
  Future<bool> validateOtp({required String phone, String? otp}) async {
    emit(state.copyWith(currState: Loading()));
    var validateOtp = await loginRepository.validateOtp(
      phone: phone,
      otp: otp ?? state.oTPCode,
    );
    if (validateOtp.isError) {
      MessageService.showToast(
        msg: validateOtp.asError?.error.toString() ?? "",
        state: ToastStates.error,
      );
      emit(state.copyWith(currState: Error()));
      return false;
    }
    getIt<ILocalPreference>().saveAppUser(
      validateOtp.asValue?.value.user?.copyWith(
        token: validateOtp.asValue?.value.token,
      ),
    );
    log("validateOtp.asValue?.value.token::${validateOtp.asValue?.value.token}");
    log("appUser::${getIt<ILocalPreference>().appUser.value?.token}");
    emit(state.copyWith(currState: Success()));


    getIt<AppRouter>().replaceAll([
      HomeBottomTabsRoute(),
    ], updateExistingRoutes: false);


    return true;
  }


}
