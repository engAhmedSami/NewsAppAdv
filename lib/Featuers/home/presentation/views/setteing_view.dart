import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/setteing_view_body.dart';

class SetteingView extends StatelessWidget {
  const SetteingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarC(
        title: 'Settings',
        context,
      ),
      body: const SettingViewBody(),
    );
  }
}
