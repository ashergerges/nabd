import 'package:flutter/services.dart';
import 'package:nawy/features/common/ui/widgets/circular_icon_button.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

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
