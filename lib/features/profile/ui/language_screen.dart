import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/interfaces/i_local_preference.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/constants/translations.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

import '../../../main_common.dart';
@RoutePage()
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "اللغة",),
      body: LanguageSelector(currentLang:  context.isEnglish ? "English" : "العربية",),
    );
  }
}


class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key, required this.currentLang});
  final String currentLang;
  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  late String _selected; // holds "English" or "العربية"


  void changeLanguage()
  {

    // Choose locale based on selection
    final locale = _selected == "English"
        ? const Locale('en')
        : const Locale('ar');


    // Apply language with EasyLocalization
    // (you can also use: context.setLocale(locale); if you use the extension)
    EasyLocalization.of(context)?.setLocale(locale);
  }

  @override
  void initState() {
    super.initState();
    // Start with current language (from context.isEnglish)
    _selected = widget.currentLang;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.padHorizontal+24.padTop,
      child: Column(
        children: [
          _buildOption('English', isSelected: _selected == "English"),
          24.verticalSpace,
          _buildOption('عربي', isSelected: _selected != "English"),
        ],
      ),
    );
  }

  Widget _buildOption(String language, {required bool isSelected }) {

    return OnTap(
      onTap: (){
        setState(() {
          _selected = language;
        });
        changeLanguage();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style:AppTextTheme.bodyLargeSemiBold(context)
          ),
          CustomRadioButton(
            isSelected:isSelected,
          ),
        ],
      ),
    );
  }
}
class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final double size;
  final double borderWidth;

  const CustomRadioButton({
    super.key,
    required this.isSelected,
    this.size = 24,
    this.borderWidth = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    final double innerSize = size / 2;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary,
          width: borderWidth,
        ),
        color: AppColors.white,
      ),
      child: Center(
        child: isSelected
            ? _buildEnabledInner(innerSize)
            : _buildDisabledInner(innerSize),
      ),
    );
  }

  Widget _buildEnabledInner(double innerSize) {
    return Container(
      width: innerSize,
      height: innerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildDisabledInner(double innerSize) {
    return Container(
      width: innerSize,
      height: innerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary100,
          width: 2,
        ),
        color: Colors.transparent,
      ),
    );
  }
}
