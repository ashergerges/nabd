import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/core/router/app_router.dart';
import 'package:nawy/core/utils/common_widgets/on_tap.dart';
import 'package:nawy/main_common.dart';

part 'tab_bar_state.dart';

part 'tab_bar_cubit.freezed.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState.tabBarIndex());

  String? selectedSportId;

  List get navScreens => [
    Container(
      child: Column(
        children: [
          200.verticalSpace,
          Center(child: OnTap(
              onTap: (){
                getIt<AppRouter>().push(VendorDetailsRoute(vendorDetailsId: 11));
              },
              child: Text("VEndor"))),
        ],
      ),
    ),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void selectScreen({required int index, String? sportId}) {
    selectedSportId = sportId;
    emit(state.copyWith(activeScreen: index));
  }
}
