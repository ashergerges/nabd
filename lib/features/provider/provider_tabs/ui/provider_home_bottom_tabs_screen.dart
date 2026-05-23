import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/core/utils/constants/app_colors.dart';
import 'package:nawy/features/provider/provider_tabs/ui/bottom_nav_provider.dart';

import '../cubit/tab_bar_provider_cubit.dart';


@RoutePage()
class ProviderHomeBottomTabsScreen extends StatelessWidget {
  final int index;


  const ProviderHomeBottomTabsScreen({super.key, this.index = 0,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TabBarCubit()..selectScreen(index: index,),
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
              bottomNavigationBar: NavigationBarProviderItems(
                onTap: (index) {
                  context.read<TabBarCubit>().selectScreen(
                    index: index,
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
