import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:newsapp/Featuers/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
