import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/services/dialogs/message_service.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/locale_keys.g.dart';

class ReviewWidget extends StatefulWidget {
  final void Function(int rating, String? comment)? onSubmit;
  final Function()? onCancel;
  final String title;
  final String subTitle;

  const ReviewWidget({
    super.key,
    this.onSubmit,
    this.onCancel,
    required this.title,
    required this.subTitle,
  });

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  int _selectedRating = 0;
  String _comment = "";

  void _handleSubmit(BuildContext context) {

    widget.onSubmit?.call(
      _selectedRating,
      _comment.isEmpty ? null : _comment.trim(),
    );

    if(_selectedRating>4){
      MessageService.showNewCustomDialog(context, child:
      IntrinsicHeight(
        child: Center(
          child: Container(
            margin: 20.padAll,
            padding: 16.padAll,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(LocaleKeys.rateUs.tr(),style: AppTextTheme.bodyLarge(context),),
                12.verticalSpace,
                AppButton(
                  text: LocaleKeys.confirm.tr(),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                    UrlLauncher.openWebInApp( Platform.isAndroid
                        ?"https://play.google.com/store/apps/details?id=com.art4muslim.hamim":
                    "https://apps.apple.com/us/app/id6446170693?action=write-review"
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )
      );
    }else{
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Center(
        child: Container(
          margin: 20.padAll,
          padding: 16.padAll,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title, style: AppTextTheme.bodyLarge(context)),
              4.verticalSpace,
              Text(
                widget.subTitle,
                style: AppTextTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w400),
              ),

              16.verticalSpace,

              // ⭐ Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => Padding(
                    padding: 5.padHorizontal,
                    child: OnTap(
                      onTap: () => setState(() => _selectedRating = index + 1),
                      child: Icon(
                        index < _selectedRating ? Icons.star_rounded : Icons.star_border_rounded,
                        color: Colors.amber,
                        size: 35.h,
                      ),
                    ),
                  ),
                ),
              ),

              16.verticalSpace,

              // COMMENT FIELD
              AppTextField(
                maxLines: 3,
                keyBord: TextInputType.name,
                label:LocaleKeys.addYourCommentHere.tr(),
                onChange: (value) {
                  _comment = value??'';
                },
              ),

              16.verticalSpace,

              // BUTTONS
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      background: AppColors.primary900,
                      textColor: AppColors.white,
                      padding: 10.padVertical+16.padHorizontal,
                      onTap:(){

                        _handleSubmit(context);
                      },
                      text: LocaleKeys.confirm.tr(),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child:
                    AppButton(
                      background: AppColors.primary.withValues(alpha: .2),
                      border:Border.all(color: AppColors.primary),
                      textColor: AppColors.primary,
                      padding: 10.padVertical+16.padHorizontal,
                      onTap: widget.onCancel??(){},
                      text:LocaleKeys.cancel.tr(),
                    ),

                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

