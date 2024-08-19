import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsapp/Core/services/firebase_auth_service.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
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
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),

          // Theme Selection Options
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Theme'),
            trailing: DropdownButton<ThemeMode>(
              value: themeProvider.themeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Mode'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Mode'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Default'),
                ),
              ],
              onChanged: (ThemeMode? newMode) {
                if (newMode != null) {
                  themeProvider.toggleTheme(newMode);
                }
              },
            ),
          ),

          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
          ),
          const Divider(),

          // Additional Options
          const ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy'),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
          ),

          // Sign Out Option
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              bool rememberMe = await userPrefs.isRememberMe();
              await userPrefs.clearLoginState(rememberMe: rememberMe);
              await firebaseAuthService.signOut();
            },
          ),
        ],
      ),
    );
  }
}
