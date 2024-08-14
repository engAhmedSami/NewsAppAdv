import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/user_info_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [UserInfoView()],
    );
  }
}
