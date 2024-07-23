import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/splash/presentation/views/widget/animate_splash_view.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe4e8e9),
      body: AnimatedSplashScreen(),
    );
  }
}
