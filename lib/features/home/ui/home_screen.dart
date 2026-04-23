import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
import 'package:nawy/core/utils/extensions/padding_extensions.dart';

import '../../../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        children: [
      CustomTopBar(
      child: Padding(
      padding: 10.padBottom,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.svg.logoName.svg(height: 30.h),
            Assets.svg.search.svg(height: 24.h),
          ],
        ),
      ),
    ),]),
    );
  }
}
