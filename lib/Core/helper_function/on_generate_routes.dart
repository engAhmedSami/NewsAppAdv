import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/auth/presentation/view/forgot_password_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/otp_phone_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/phone_signin_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signin_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signup_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Core/services/auth_handeler.dart';
import 'package:newsapp/Featuers/home/user_info/persentation/views/user_info_view.dart';
import 'package:newsapp/Featuers/home/presentation/views/nav_bar.dart';
import 'package:newsapp/Featuers/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:newsapp/Featuers/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case ForgotPasswordView.routName:
      return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView());
    case VerfiedEmailView.routeName:
      return MaterialPageRoute(builder: (context) => const VerfiedEmailView());
    case PhoneSigninView.routeName:
      return MaterialPageRoute(builder: (context) => const PhoneSigninView());
    case OtpPhoneView.routeName:
      return MaterialPageRoute(
        builder: (context) => OtpPhoneView(
          verificationId: setting.arguments as String,
        ),
      );
    case UserInfoView.routeName:
      return MaterialPageRoute(builder: (context) => const UserInfoView());
    case AuthHandler.routeName:
      return MaterialPageRoute(builder: (context) => const AuthHandler());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
