import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:nawy/core/utils/common_widgets/custom_appbar.dart';
@RoutePage()
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "الدعم",),
    );
  }
}
