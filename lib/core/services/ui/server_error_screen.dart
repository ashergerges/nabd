import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:nawy/main_common.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/locale_keys.g.dart';

@RoutePage()
class ServerErrorScreen extends StatelessWidget {
  ServerErrorScreen({super.key, required this.currentRoute});

  final AutoRoutePage<dynamic> currentRoute;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Lottie.asset(Assets.animations.noInternet.path, width: double.infinity),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 55),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Text(LocaleKeys.whoops.tr(), style: AppTextTheme.headingLarge(context)),
                  5.verticalSpace,
                  Padding(
                    padding: 40.padHorizontal,
                    child: Text(
                      LocaleKeys.serverErrorMessage.tr(),
                      style: AppTextTheme.bodyMedium(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  10.verticalSpace,
                  ValueListenableBuilder<bool>(
                    valueListenable: isLoading,
                    builder: (context, value1, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                        child: !value1
                            ? LoadingAnimationWidget.twoRotatingArc(
                                color: AppColors.error,
                                size: 25,
                              )
                            : AppButton(
                                onTap: () {
                                  final PageRouteInfo? currentPage = getIt<AppRouter>().matcher
                                      .match(currentRoute.routeData.path)
                                      ?.first
                                      .toPageRouteInfo()
                                      .copyWith(args: currentRoute.routeData.args);
                                  isLoading.value = false;
                                  getIt<AppRouter>().replace(currentPage!);
                                },
                                width: 170,
                                text: LocaleKeys.tryAgain.tr(),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
