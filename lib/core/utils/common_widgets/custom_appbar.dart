import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/features/common/ui/widgets/circular_icon_button.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.isHaveBackButton = true,
    this.isCenterText = true,
    this.backgroundColor,
    this.iconColor,
    this.onBackPressed,
    this.actions,
    this.textStyle,
  });

  final String title;
  final bool isHaveBackButton;
  final bool? isCenterText;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Function()? onBackPressed;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenterText,
      toolbarHeight: kToolbarHeight + (!ResponsiveScreen.isTablet(context: context) ? 0 : 45),
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor ?? AppColors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
      title: Text(title, style: textStyle ?? AppTextTheme.bodyLargeMediumWeight(context)),
      actions: actions,
      automaticallyImplyLeading: isHaveBackButton,
      leading: isHaveBackButton
          ? CircularIconButton(
              margin: context.isArabic ? 15.padRight : 15.padLeft,
              isWithBorder: true,
              onTap: () {
                onBackPressed != null ? onBackPressed!() : Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward_ios_rounded)
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (!ResponsiveScreen.isTablet() ? 0 : 30));
}

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.padAll,
      decoration:  BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: AppColors.primary100)
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OnTap(
                onTap: (){
                context.maybePop();
                },
                child: _circleButton(Icon(Icons.arrow_back,color: AppColors.primary,size: 28.h,))),
            Row(
              children: [
                _circleButton(Assets.svg.share.svg(height: 26.h,)),
                16.horizontalSpace,
                _circleButton(Assets.svg.favouriteCircle.svg(height: 28.h,)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(Widget child) {
    return Container(
      padding: 5.padAll,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: child
    );
  }
}