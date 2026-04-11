import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawy/core/utils/constants/topic.dart';
import 'package:nawy/features/splash/cubits/splash_cubit/splash_cubit.dart';
import 'package:nawy/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // comment this if you use lottie
  // late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(
          vsync: this,
          // comment this if you use lottie
          // duration: const Duration(seconds: 3),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (context.mounted) {
              log("mounted11#1");
              Topic.subscribeToGuest(context: context);
              final splashCubit = context.read<SplashCubit>();
              splashCubit.init();
              //   context.router.replaceAll([ OnBoardingRoute()]);
            }
          }
        });

    // comment the following if you use lottie
    // _scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
    //   CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    // );
    //
    // _animationController.forward();
    //---------------------------------------
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Lottie.asset(
        Assets.animations.splash.path,
        repeat: false,
        // Set to false to avoid looping
        controller: _animationController,
        onLoaded: (composition) {
          // Configure the animation duration and forward it
          _animationController
            ..duration = composition.duration
            ..forward();
        },

        // Callback for animation completion
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
