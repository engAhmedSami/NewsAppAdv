import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/user_info/persentation/views/user_info_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [UserInfoView()],
    );
  }
}
