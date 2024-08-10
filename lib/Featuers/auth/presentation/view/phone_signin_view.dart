import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/build_app.dart';

import 'widget/phone_signin_view_body.dart';

class PhoneSigninView extends StatelessWidget {
  const PhoneSigninView({super.key});
  static const routeName = 'Signin phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Phone Signin',
      ),
      body: const PhoneSigninViewBody(),
    );
  }
}
