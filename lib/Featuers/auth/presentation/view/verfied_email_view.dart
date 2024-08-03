import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/build_app.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/verfied_email_view_body.dart';

class VerfiedEmailView extends StatelessWidget {
  const VerfiedEmailView({super.key});
  static const routeName = 'verify';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Verfied Email',
      ),
      body: const VerfiedEmailViewBody(),
    );
  }
}
