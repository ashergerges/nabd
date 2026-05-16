import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/app_button.dart';
import 'package:nawy/core/utils/common_widgets/app_text_field.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/core/utils/constants/app_text_them.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';
import 'package:nawy/gen/locale_keys.g.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../gen/assets.gen.dart' show Assets;

@RoutePage()
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:  LocaleKeys.address.tr()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: 24.padHorizontal,
            child: AppTextField(
              label: LocaleKeys.riyadhMalqa.tr(),
              imagePre: Assets.svg.search.path,
              radius: 12,
            ),
          ),
          24.verticalSpace,
          Container(
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary100,),
              borderRadius: BorderRadius.circular(
                12,
              ), // optional rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // match the container radius
              child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(22, 42),
                  zoom: 19,
                ),
                onMapCreated: (controller) {},
                onCameraMove: (pos) {},
                onCameraIdle: () {},
                markers: const {},
              ),
            ),
          ),
          24.verticalSpace,
          Padding(
            padding: 24.padHorizontal,
            child: Text(
              LocaleKeys.riyadhMalqa.tr(),
              style: AppTextTheme.bodyLargeSemiBold(context),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: 16.padAll,
        child: AppButton(text:  LocaleKeys.save.tr()),
      ),
    );
  }
}
