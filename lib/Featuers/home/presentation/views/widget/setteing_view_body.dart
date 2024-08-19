import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Core/services/firebase_auth_service.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signin_view.dart';
import 'package:newsapp/Featuers/home/user_info/persentation/views/widget/user_info_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/Core/helper_function/theme_provider.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  @override
  Widget build(BuildContext context) {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    UserPrefs userPrefs = UserPrefs();
    FirebaseAuthService firebaseAuthService = FirebaseAuthService();
    final themeProvider = Provider.of<ThemeProvider>(context);

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
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (bool value) {
                themeProvider.toggleTheme();
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

          // Sign Out Option
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              bool rememberMe = await userPrefs.isRememberMe();
              await userPrefs.clearLoginState(rememberMe: rememberMe);
              await firebaseAuthService.signOut();

              if (!mounted) return; // Ensure context is still valid
              Navigator.of(context).pushReplacementNamed(SigninView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
