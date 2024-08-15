import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsapp/Featuers/home/user_info/persentation/views/widget/user_info_list_tile.dart';

class NewsHomeViewBody extends StatelessWidget {
  const NewsHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              if (user != null) UserInfoListTile(uid: user.uid),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ]),
    );
  }
}
