import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/build_app.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/phone_signin_view_body_bloc_consumer.dart';

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
      body: const PhoneSigninViewBodyBlocConsumer(),
    );
  }
}
