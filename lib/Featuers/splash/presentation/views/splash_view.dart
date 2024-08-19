import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/splash/presentation/views/widget/animate_splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = 'Splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const AnimatedSplashViewBody(),
    );
  }
}
