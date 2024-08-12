import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/otp_phone_view_body.dart';

class OtpPhoneView extends StatelessWidget {
  const OtpPhoneView({super.key});
  static const routeName = 'OtpPhoneView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarC(
        context,
      ),
      body: const OtpPhoneViewBodyBlocConsumer(),
    );
  }
}

class OtpPhoneViewBodyBlocConsumer extends StatelessWidget {
  const OtpPhoneViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const OtpPhoneViewBody();
  }
}
