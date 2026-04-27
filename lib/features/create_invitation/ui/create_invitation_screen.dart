import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/services/launcher/url_launcher.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/features/book/ui/widgets/date_picker_widget.dart';
import 'package:nawy/features/create_invitation/ui/contact_picker_sheet.dart';

import '../../../gen/assets.gen.dart';
@RoutePage()
class CreateInvitationScreen extends StatelessWidget {
  const CreateInvitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "انشاء الدعوات"),
      body: SingleChildScrollView(
        padding: 24.padHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("أدخل البيانات",style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w300),),
            24.verticalSpace,
            Text("اسم قاعة الزفاف",style: AppTextTheme.bodyLarge(context),),
            12.verticalSpace,
            Container(
              width: double.infinity,
              padding: 24.padHorizontal+8.padVertical,
              decoration: BoxDecoration(color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary100)),
              child: Text("سيششسيتاسي",style: AppTextTheme.bodyLargeSemiBold(context),),
            ),
            24.verticalSpace,
            Text("الموقع",style: AppTextTheme.bodyLarge(context),),
            12.verticalSpace,
            Container(
              width: double.infinity,
              padding: 24.padHorizontal+8.padVertical,
              decoration: BoxDecoration(color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary100)),

              child: OnTap(
                onTap: (){
                  UrlLauncher.openGoogleMapWithDic(30, 40);
                },
                child: Row(
                  children: [
                    Assets.svg.location.svg(height: 24.h),
                    8.horizontalSpace,
                    Text("12شارع يسيس",style: AppTextTheme.bodyLargeSemiBold(context).copyWith(decorationColor: AppColors.textColor,decoration: TextDecoration.underline),),
                  ],
                ),
              ),
            ),
            24.verticalSpace,
            Text("اسم العروسة",style: AppTextTheme.bodyLarge(context),),
            12.verticalSpace,
            AppTextField(label: "",fillColor: AppColors.backgroundColor,radius: 12.r,),
            24.verticalSpace,
            Text("اسم العريس",style: AppTextTheme.bodyLarge(context),),
            12.verticalSpace,
            AppTextField(label: "",fillColor: AppColors.backgroundColor,radius: 12.r,),
            24.verticalSpace,
            Text("التاريخ",style: AppTextTheme.bodyLarge(context),),
            12.verticalSpace,
            DatePickerWidget(),
            12.verticalSpace,
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: 16.padAll,
        child: AppButton(
            onTap: (){
              showContactPickerSheet(context);
            },
            text: "ارسال"),
      ),

    );
  }
}
