import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
@RoutePage()
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "تعديل الملف الشخصي",),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text( "الاسم"),
          TextFormField(
            onChanged: (value){},
            onTapOutside: (v) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              hintText: "سارة هاني",
              hintStyle: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.neutral300),

              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),

          SizedBox(height: 24),

          Text("رقم الجوال"),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: IntrinsicWidth(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 12),
                    Text(
                      "+996",
                      style: AppTextTheme.bodyLarge(context).copyWith(color: AppColors.primary),
                    ),
                    SizedBox(width: 8),
                    Container(width: 1, height: 20, color: Colors.grey.shade300),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              hintText: "رقم الجوال",
              hintStyle: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.neutral300),
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (value.length < 9) {
                return 'Phone number is too short';
              }
              return null;
            },
          ),        ],
      ),
    );
  }
}
