import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsapp/Featuers/home/presentation/user_info/persentation/views/widget/user_info_list_tile.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            if (user != null) UserInfoListTile(uid: user.uid),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
