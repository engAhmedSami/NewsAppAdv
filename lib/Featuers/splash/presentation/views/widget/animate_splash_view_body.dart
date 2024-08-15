// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signin_view.dart';
import 'package:newsapp/Featuers/home/presentation/views/nav_bar.dart';
import 'package:newsapp/Featuers/on_boarding/presentation/view/on_boarding_view.dart';

import 'package:newsapp/Featuers/splash/presentation/views/widget/splash_view_text.dart';
import 'package:newsapp/constants.dart';

class AnimatedSplashViewBody extends StatefulWidget {
  const AnimatedSplashViewBody({super.key});

  @override
  AnimatedSplashViewBodyState createState() => AnimatedSplashViewBodyState();
}

class AnimatedSplashViewBodyState extends State<AnimatedSplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animation
    _controller.forward();

    // Add listener to handle navigation upon animation completion
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        bool isLoggedIn = await UserPrefs().isLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          bool isOnBoardingViewSeen =
              Prfs.getBool(kIsOnBoardingViewSeen) ?? false;
          if (isOnBoardingViewSeen) {
            Navigator.pushReplacementNamed(context, SigninView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewText(
        controller: _controller,
        opacityAnimation: _opacityAnimation,
        scaleAnimation: _scaleAnimation,
      ),
    );
  }
}
