import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nabd/core/router/app_router.dart';
import 'package:nabd/core/utils/common_widgets/on_tap.dart';
import 'package:nabd/features/home/ui/home_screen.dart';
import 'package:nabd/main_common.dart';

part 'tab_bar_state.dart';

part 'tab_bar_cubit.freezed.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState.tabBarIndex());


  List get navScreens => [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void selectScreen({required int index,}) {
    emit(state.copyWith(activeScreen: index));
  }
}
