import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Core/services/firebase_auth_service.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signin_view.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/user_info_list_tile.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    UserPrefs userPrefs = UserPrefs();
    FirebaseAuthService firebaseAuthService = FirebaseAuthService();

    return SingleChildScrollView(
      child: Column(
        children: [
          // User Profile Section
          UserInfoListTile(uid: uid),
          const Divider(),

          // Settings Options
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Handle Notifications setting
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // Handle dark mode toggle
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            onTap: () {
              // Handle Language setting
            },
          ),
          const Divider(),

          // Additional Options
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy'),
            onTap: () {
              // Handle Privacy setting
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Handle About setting
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () async {
              bool rememberMe = await userPrefs.isRememberMe();
              await userPrefs.clearLoginState(rememberMe: rememberMe);
              await firebaseAuthService.signOut();
              Navigator.of(context).pushReplacementNamed(SigninView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
