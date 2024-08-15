import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signin_view.dart';
import 'package:newsapp/Featuers/home/user_info/persentation/views/user_info_view.dart';
import 'package:newsapp/Featuers/home/presentation/views/nav_bar.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key});

  static const String routeName = 'AuthHandler';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return FutureBuilder(
            future: checkUserInfoExists(snapshot.data!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                      strokeWidth: 3,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data == true) {
                // User info exists, navigate to home
                return const HomeView();
              } else {
                // User info does not exist, navigate to UserInfoView
                return const UserInfoView();
              }
            },
          );
        } else {
          // User is not logged in, show login screen
          return const SigninView();
        }
      },
    );
  }

  Future<bool> checkUserInfoExists(String uid) async {
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return docSnapshot.exists;
  }
}
