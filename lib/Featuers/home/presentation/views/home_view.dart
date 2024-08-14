// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:newsapp/Core/services/firebase_auth_service.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signin_view.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/user_info_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    UserPrefs userPrefs = UserPrefs();
    FirebaseAuthService firebaseAuthService = FirebaseAuthService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            bool rememberMe = await userPrefs.isRememberMe();
            await userPrefs.clearLoginState(rememberMe: rememberMe);
            await firebaseAuthService.signOut();
            Navigator.of(context).pushReplacementNamed(SigninView.routeName);
          },
          icon: const Icon(Icons.logout),
        ),
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: const UserInfoView(),
    );
  }
}
