import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/build_app.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'Signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'SignUp'),
      body: const SignupViewBody(),
    );
  }
}
