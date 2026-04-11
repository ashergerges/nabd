import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_bar_state.dart';

part 'tab_bar_cubit.freezed.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState.tabBarIndex());

  String? selectedSportId;

  List get navScreens => [Container(),Container(),Container(),Container(),Container(),];

  void selectScreen({required int index, String? sportId}) {
    selectedSportId = sportId;
    emit(state.copyWith(activeScreen: index));
  }
}
