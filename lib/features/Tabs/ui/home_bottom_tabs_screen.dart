import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/features/Tabs/cubit/tab_bar_cubit.dart';
import 'package:nawy/features/Tabs/ui/bottom_nav.dart';

@RoutePage()
class HomeBottomTabsScreen extends StatelessWidget {
  final int index;

  //used only from home screen to navigate to search with filter by sport
  final String? sportId;

  const HomeBottomTabsScreen({super.key, this.index = 0, this.sportId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TabBarCubit()..selectScreen(index: index, sportId: sportId),
      child: BlocBuilder<TabBarCubit, TabBarState>(
        builder: (context, state) {
          return PopScope(
            canPop: state.activeScreen == 0 ? true : false,
            onPopInvokedWithResult: (didPop, result) async {
              if (state.activeScreen != 0) {
                context.read<TabBarCubit>().selectScreen(index: 0);
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: context.read<TabBarCubit>().navScreens[state.activeScreen],
              bottomNavigationBar: NavigationBarItems(
                onTap: (index) {
                  context.read<TabBarCubit>().selectScreen(
                    index: index,
                    sportId: sportId,
                  );
                },
                activeScreen: state.activeScreen,
              ),
            ),
          );
        },
      ),
    );
  }
}
