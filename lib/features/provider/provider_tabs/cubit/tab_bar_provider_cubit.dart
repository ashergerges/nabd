import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nawy/features/categories/ui/categories_screen.dart';
import 'package:nawy/features/home/ui/home_screen.dart';
import 'package:nawy/features/my_booking/ui/my_booking_screen.dart';
import 'package:nawy/features/profile/ui/profile_screen.dart';
import 'package:nawy/features/provider/profile_provider/ui/profile_provider_screen.dart';

part 'tab_bar_provider_state.dart';

part 'tab_bar_provider_cubit.freezed.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState.tabBarIndex());


  List get navScreens => [
    MyBookingScreen(),
    ProfileProviderScreen(),
  ];

  void selectScreen({required int index, }) {
    emit(state.copyWith(activeScreen: index));
  }
}
